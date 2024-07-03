import 'dart:convert';

class AddSectionRequestModel {
  int courseId;
  String title;

  AddSectionRequestModel({
    required this.courseId,
    required this.title,
  });

  String toJson() => json.encode({
        "courseId": courseId,
        "title": title,
      });
}
