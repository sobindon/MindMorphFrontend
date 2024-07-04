// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InstructorCourseModel {
  String id;
  int courseId;
  String title;
  String courseThumbnailUrl;
  double? price;

  InstructorCourseModel(
      {required this.id,
      required this.courseId,
      required this.title,
      required this.courseThumbnailUrl,
      this.price});

  factory InstructorCourseModel._fromJson(Map<String, dynamic> json) =>
      InstructorCourseModel(
        id: json["_id"],
        courseId: json["courseId"],
        title: json["title"],
        courseThumbnailUrl: json["courseThumbnailUrl"],
      );

  static List<InstructorCourseModel> fromResponse(String response) =>
      List<InstructorCourseModel>.from(
          json.decode(response).map((x) => InstructorCourseModel._fromJson(x)));

  @override
  String toString() => "_id: "
      '$id, ${id.runtimeType}\n+'
      "courseId: "
      '$courseId, ${courseId.runtimeType}\n+'
      "title: "
      '$title, ${title.runtimeType}\n+'
      "courseThumbnailUrl: "
      '$courseThumbnailUrl,${courseThumbnailUrl.runtimeType}\n';
}
