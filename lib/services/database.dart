import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:timer_tracker/app/home/models/job.dart';
import 'package:timer_tracker/services/api_path.dart';

abstract class Database {
  // CREATE, UPDATE, DELETE
  // Create an existing job
  Future<void> createJob(Job job);
  void readJobs();
  /*
  // Delete an existing job
  Future<void> deleteJob(Job job);
  // Create a new entry / edit an existing entry
  Future<void> setEntry(Entry entry);
  // Delete an existing entry
  Future<void> deleteEntry(Entry entry);
  // READ
  // List all my jobs
  Stream<List<Job>> jobsStream();
  Stream<List<Entry>> entriesStream({Job job});*/
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  @override
  Future<void> createJob(Job job) => _setData(
        path: APIPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );
  //testing

  void readJobs() {
    final path = APIPath.jobs(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    snapshots.listen((snapshot) {
      snapshot.docs.forEach((snapshot) => print(snapshot.data()));
    });
  }

  Future<void> _setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');

    await reference.set(data);
  }
}
