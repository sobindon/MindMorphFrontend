import 'package:http/http.dart' as http;
import '../../models/course_section/upload_lecture.dart';
import '/constants/urls.dart';

class CourseSectionProvider {
  static Future<http.Response> addSection(String data) async {
    final uri = Uri.http(COURSE_SERVER, '/section');
    final headers = {'Content-type': 'application/json'};

    final response = await http.post(
      uri,
      headers: headers,
      body: data,
    );
    return response;
  }

  static Future<http.Response> previewSection(int courseId) async {
    final uri = Uri.http(COURSE_SERVER, '/section/course/$courseId');
    return await http.get(uri);
  }

  // Upload Lecture
  static Future<http.Response> uploadLecture(UploadLectureData data) async {
    final uri = Uri.http(COURSE_SERVER, '/lecture');
    final header = {'Content-type': 'multipart/form-data'};

    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(header);
    request.fields.addAll(data.fields); // assign a map here
    request.files.addAll(await data.files);

    final response = await http.Response.fromStream(await request.send());

    return response;
  }
}
