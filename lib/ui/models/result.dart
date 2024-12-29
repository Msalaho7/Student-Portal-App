class Result {
  String courseName;
  String courseGrade;
  String courseTotal;
  String courseYear;
  String courseSemester;

  Result({
    required this.courseName,
    required this.courseGrade,
    required this.courseTotal,
    required this.courseYear,
    required this.courseSemester,
  });


  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
      'courseGrade': courseGrade,
      'courseTotal': courseTotal,
      'courseYear': courseYear,
      'courseSemester': courseSemester,
    };
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      courseName: json['courseName'],
      courseGrade: json['courseGrade'],
      courseTotal: json['courseTotal'],
      courseYear: json['courseYear'],
      courseSemester: json['courseSemester'],
    );
  }
}