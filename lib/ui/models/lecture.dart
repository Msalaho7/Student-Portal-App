/// Lecture: The constructor to create a new Lecture object.
/// toJson(): Converts the Lecture object to a JSON Map.
/// fromJson(): Creates a Lecture object from a JSON Map.

class Lecture {
  String lectureTime;
  String lectureDay;
  String lecturePlace;
  String instructor;

  Lecture({
    required this.lectureTime,
    required this.lectureDay,
    required this.lecturePlace,
    required this.instructor,
  });

  Map<String, dynamic> toJson() {
    return {
      'lectureTime': lectureTime,
      'lectureDay': lectureDay,
      'lecturePlace': lecturePlace,
      'instructor': instructor,
    };
  }

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      lectureTime: json['lectureTime'],
      lectureDay: json['lectureDay'],
      lecturePlace: json['lecturePlace'],
      instructor: json['instructor'],
    );
  }
}