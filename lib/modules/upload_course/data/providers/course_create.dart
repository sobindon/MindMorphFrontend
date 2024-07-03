import 'package:http/http.dart' as http;
// import 'package:velocity_x/velocity_x.dart';
import '../../models/course_create/request_model.dart';
import '/constants/urls.dart';

class CourseCreateProvider {
  static Future<http.Response> send(CourseCreateRequestModel data) async {
    final uri = Uri.http(COURSE_SERVER, '/courses');
    final header = {'Content-type': 'multipart/form-data'};

    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(header);
    request.fields.addAll(data.fields); // assign a map here
    request.files.addAll(await data.files);

    final response = await http.Response.fromStream(await request.send());

    return response;
  }
}
