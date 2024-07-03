import 'dart:convert';

class InitCourseResponseModel {
  InitCourseResponseModel({
    required this.message,
    required this.courseId,
  });

  final String message;
  final int courseId;

  InitCourseResponseModel copyWith({
    String? message,
    int? courseId,
  }) {
    return InitCourseResponseModel(
      message: message ?? this.message,
      courseId: courseId ?? this.courseId,
    );
  }

  factory InitCourseResponseModel.fromResponse(String response) {
    Map<String, dynamic> json = jsonDecode(response);
    return InitCourseResponseModel(
      message: json["message"],
      courseId: json["courseId"],
    );
  }

  String toJson() => jsonEncode({"message": message, "courseId": courseId});

  @override
  String toString() {
    return "$message, $courseId, ";
  }
}
