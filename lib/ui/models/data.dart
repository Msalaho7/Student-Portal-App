import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/student.dart';
import '../models/lecture.dart';
import '../models/result.dart';

//Data Serialization , Saving and loading Student , Lectures and Results Data.

Future<void> saveStudentInfo(Student student) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(student.toJson());
  await prefs.setString('studentInfo', jsonString);
}

Future<Student?> loadStudentInfo() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('studentInfo');
  if (jsonString != null) {
    final jsonMap = jsonDecode(jsonString);
    return Student.fromJson(jsonMap);
  }
  return null;
}

Future<void> saveLectures(List<Lecture> lectures) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = lectures.map((lecture) => lecture.toJson()).toList();
  final jsonString = jsonEncode(jsonList);
  await prefs.setString('lectures', jsonString);
}

Future<List<Lecture>> loadLectures() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('lectures');
  if (jsonString != null) {
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => Lecture.fromJson(json)).toList();
  }
  return [];
}

Future<void> saveResults(List<Result> results) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = results.map((result) => result.toJson()).toList();
  final jsonString = jsonEncode(jsonList);
  await prefs.setString('results', jsonString);
}

Future<List<Result>> loadResults() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('results');
  if (jsonString != null) {
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => Result.fromJson(json)).toList();
  }
  return [];
}