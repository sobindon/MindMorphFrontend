import 'package:http/http.dart' as http;
import '../../models/course_init/submit_model.dart';
import '/constants/urls.dart';

Future<http.Response> courseInitializationSubmit(
    CourseInitializeSubmitModel data) async {
  // print(data.toString());
  // print('JSON: ${data.toJson()}');
  var uri = Uri.http(NODE_SERVER, '/course');

  final response = await http.post(uri,
      headers: {'Content-type': 'application/json'}, body: data.toJson());
  return response;
}
