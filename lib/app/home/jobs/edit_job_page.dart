import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timer_tracker/app/home/models/job.dart';
import 'package:timer_tracker/common_widgets/show_alert_dialog.dart';
import 'package:timer_tracker/common_widgets/show_exception_alert_dialog.dart';
import 'package:timer_tracker/services/database.dart';

class EditJobPage extends StatefulWidget {
  const EditJobPage({
    Key? key,
    this.database,
    this.job,
  }) : super(key: key);
  final Database? database;
  final Job? job;

  static Future<void> show(
    BuildContext context, {
    Database? database,
    Job? job,
  }) async {
    //note: context of jobs page, so can call the database
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditJobPage(
          database: database,
          job: job,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditJobPageState createState() => _EditJobPageState();
}

class _EditJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _ratePerHour = 0;

  @override
  void initState() {
    super.initState();
    if (widget.job != null) {
      _name = widget.job?.name ?? '';
      _ratePerHour = widget.job?.ratePerHour ?? 0;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;

    if (form?.validate() ?? false) {
      form?.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        final jobs = await widget.database?.jobsStream().first;
        final allNames = jobs?.map((job) => job.name).toList();
        if (widget.job != null) {
          allNames?.remove(widget.job?.name);
        }
        if (allNames != null && allNames.contains(_name)) {
          showAlertDialog(
            context,
            title: 'Name already used',
            content: 'Please choose a different job name',
            defaultActionText: 'OK',
          );
        } else {
          final id = widget.job?.id ?? documentIdFromCurrentDate();
          final job = Job(id: id, name: _name, ratePerHour: _ratePerHour);
          await widget.database?.setJob(job);
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        showExceptionAlertDialog(
          context,
          title: 'Operation failed',
          exception: e,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.job == null ? 'New Job' : 'Edit Job'),
        actions: [
          ElevatedButton(
            onPressed: _submit,
            child: const Text(
              'Save',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        initialValue: _name,
        onSaved: (value) => _name = value ?? '',
        validator: (value) {
          return value?.isNotEmpty ?? false ? null : 'Name cant\'t be empty';
        },
        decoration: const InputDecoration(
          labelText: 'Job name',
        ),
      ),
      TextFormField(
        initialValue: _ratePerHour == 0 ? '' : _ratePerHour.toString(),
        onSaved: (value) => _ratePerHour = int.tryParse(value ?? '') ?? 0,
        decoration: const InputDecoration(
          labelText: 'Rate per hour',
        ),
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
      ),
    ];
  }
}
