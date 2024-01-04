class GetCurrentDateTime {
  final DateTime? testTime;
  GetCurrentDateTime({this.testTime});

  DateTime call() {
    return testTime ?? DateTime.now();
  }
}
