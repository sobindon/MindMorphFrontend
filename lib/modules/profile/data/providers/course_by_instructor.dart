import 'package:http/http.dart' as http;
import '/constants/urls.dart';

class InstructorCourses {
  static Future<http.Response> byInstructorId(int authorId) async {
    var uri = Uri.http(NODE_SERVER, '/course/author/$authorId');

    final response = await http.get(uri);
    return response;
  }

  static Future<http.Response> byCoursesIds(String requestBody) async {
    var uri = Uri.http(COURSE_SERVER, '/courses/bulk');

    final response = await http.post(uri,
        headers: {'Content-type': 'application/json'}, body: requestBody);

    return response;
  }
}
