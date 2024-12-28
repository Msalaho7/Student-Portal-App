class Student {
  String studentName;
  String fatherName;
  String studentLevel;
  String studentLatestGrade;

  Student({
    required this.studentName,
    required this.fatherName,
    required this.studentLevel,
    required this.studentLatestGrade,
  });

  Map<String, dynamic> toJson() {
    return {
      "studentName": studentName,
      "fatherName": fatherName,
      "studentLevel": studentLevel,
      "studentLatestGrade": studentLatestGrade,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentName: json["studentName"],
      fatherName: json["fatherName"],
      studentLevel: json["studentLevel"],
      studentLatestGrade: json["studentLatestGrade"],
    );
  }
}