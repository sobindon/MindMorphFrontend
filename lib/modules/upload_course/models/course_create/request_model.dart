import 'package:http/http.dart' as http;
import 'dart:io';

class CourseCreateRequestModel {
  int courseId;
  File courseThumbnail;
  String description;
  String objective;
  String requirement;
  String title;
  File titleVideo;
  CourseCreateRequestModel({
    required this.courseId,
    required this.courseThumbnail,
    required this.description,
    required this.objective,
    required this.requirement,
    required this.title,
    required this.titleVideo,
  });

  Map<String, String> get fields {
    return {
      'courseId': courseId.toString(),
      'title': title,
      'description': description,
      'objective': objective,
      'requirement': requirement
    };
  }

  Future<List<http.MultipartFile>> get files async {
    return [
      await http.MultipartFile.fromPath(
          'courseThumbnail', courseThumbnail.path),
      // http.MultipartFile(
      //   'courseThumbnail',
      //   courseThumbnail.readAsBytes().asStream(),
      //   courseThumbnail.lengthSync(),
      //   filename: basename(courseThumbnail.path),
      //   contentType: MediaType('image', 'jpeg'),
      // )
      await http.MultipartFile.fromPath('titleVideo', titleVideo.path)

      // http.MultipartFile(
      //   'titleVideo',
      //   titleVideo.readAsBytes().asStream(),
      //   titleVideo.lengthSync(),
      //   filename: basename(titleVideo.path),
      //   contentType: MediaType('video', 'mp4'),
      // )
    ];
  }

  @override
  String toString() {
    return 'CourseCreateRequestModel(courseId: $courseId, title: $title, description: $description, objective: $objective, requirement: $requirement, titleVideo: ${titleVideo.path}, courseThumbnail: ${courseThumbnail.path})';
  }
}
