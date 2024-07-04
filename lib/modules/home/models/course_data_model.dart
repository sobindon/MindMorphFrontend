import 'dart:convert';

class CourseDataModel {
  int courseId;
  String title;
  String courseThumbnailUrl;

  CourseDataModel({
    required this.courseId,
    required this.title,
    required this.courseThumbnailUrl,
  });

  factory CourseDataModel._fromJson(Map<String, dynamic> json) {
    return CourseDataModel(
      courseId: json["courseId"],
      title: json["title"],
      courseThumbnailUrl: json["courseThumbnailUrl"],
    );
  }

  // Static method to convert JSON string to Map<int, CourseDataModel>
  static Map<int, CourseDataModel> fromResponseBody(String str) {
    List<dynamic> jsonData = json.decode(str);
    Map<int, CourseDataModel> courseMap = {};

    for (var element in jsonData) {
      CourseDataModel course = CourseDataModel._fromJson(element);
      courseMap[course.courseId] = course;
    }

    return courseMap;
  }

  // Convert CourseDataModel to JSON
  // Map<String, dynamic> toJson() => {
  //   "courseId": courseId,
  //   "title": title,
  //   "courseThumbnailUrl": courseThumbnailUrl,
  // };
}
