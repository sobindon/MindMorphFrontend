// To parse this JSON data, do
//
//     final courseCreateResponseModel = courseCreateResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

// String courseCreateResponseModelToJson(CourseCreateResponseModel data) => json.encode(data.toJson());

class CourseCreateResponseModel {
  String message;
  bool success;

  CourseCreateResponseModel({required this.message, required this.success});

  factory CourseCreateResponseModel.fromResponse(Response response) {
    final result = json.decode(response.body);

    final isSuccess = response.statusCode == 201;
    final message = isSuccess
        ? result["message"]
        : '${result["message"]} due to ${result["error"]}';

    return CourseCreateResponseModel(message: message, success: isSuccess);
  }
// CourseCreateResponseModel._fromJson(json.decode(str));
}
