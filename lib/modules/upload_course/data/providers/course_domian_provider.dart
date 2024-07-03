import 'package:http/http.dart' as http;
import '/constants/urls.dart';

class CourseDomainProvider {
  static Future<http.Response> allCourseDomain() async {
    final uri = Uri.http(NODE_SERVER, '/courseDomain');

    try {
      final response = await http.get(uri);
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }
}
