import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateCourseFormController {
  final description = TextEditingController();
  final objectives = TextEditingController();
  final requirements = TextEditingController();
  final title = TextEditingController();
// Files
  File? thumbnail;
  File? titleVideo;

  void setThumbnail(File? file) {
    thumbnail = file;
  }

  void setTitleVideo(File? file) {
    titleVideo = file;
  }

  // set setThumbnail(PlatformFile? thumbnail) {
  //   this.thumbnail = thumbnail;
  // }

  // set setTitleVideo(PlatformFile? titleVideo) {
  //   this.titleVideo = titleVideo;
  // }

  // LoginRequestModel get data {
  //   return LoginRequestModel(
  //       email: email.text.trim(), password: password.text.trim());
  // }
}
