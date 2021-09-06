class Entry {
  Entry({
    this.id,
    this.jobId,
    this.start,
    this.end,
    this.comment = '',
  });

  String? id;
  String? jobId;
  DateTime? start;
  DateTime? end;
  String? comment;

  double get durationInHours => handleDurationInHours();

  double handleDurationInHours() {
    if (end != null && start != null) {
      return end!.difference(start!).inMinutes.toDouble() / 60.0;
    }
    return 0.0;
  }

  factory Entry.fromMap(Map<dynamic, dynamic> value, String id) {
    final int startMilliseconds = value['start'];
    final int endMilliseconds = value['end'];
    return Entry(
      id: id,
      jobId: value['jobId'],
      start: DateTime.fromMillisecondsSinceEpoch(startMilliseconds),
      end: DateTime.fromMillisecondsSinceEpoch(endMilliseconds),
      comment: value['comment'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'comment': comment,
    };
  }
}
