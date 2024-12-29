import 'package:flutter/material.dart';
import '../ui/models/data.dart';
import '../ui/models/lecture.dart';
import '../ui/models/result.dart';
import '../ui/models/student.dart';

//State Management , Data Access, Data Loading and Reactive UI

class DataProvider extends ChangeNotifier {
  Student? _student;
  List<Lecture> _lectures = [];
  List<Result> _results = [];

  Student? get student => _student;
  List<Lecture> get lectures => _lectures;
  List<Result> get results => _results;

  Future<void> loadAllData() async {
    await loadStudentInfo().then((value) {
      _student = value;
      notifyListeners();
    });
    await loadLectures().then((value) {
      _lectures = value;
      notifyListeners();
    });
    await loadResults().then((value) {
      _results = value;
      notifyListeners();
    });
  }
}