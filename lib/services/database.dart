import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:timer_tracker/app/home/models/job.dart';
import 'package:timer_tracker/services/api_path.dart';
import 'package:timer_tracker/services/firestore_service.dart';

abstract class Database {
  // CREATE, UPDATE, DELETE
  // Create an existing job
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
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
  final _service = FirestoreService.instance;

  @override
  Future<void> createJob(Job job) => _service.setData(
        path: APIPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );

  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
