import 'package:http/http.dart' as http;
import '/constants/urls.dart';

class CourseCategoryProvider {
  static Future<http.Response> courseCategoriesByDomain(String domainId) async {
    final uri =
        Uri.http(NODE_SERVER, '/courseCategory', {'domainId': domainId});

    try {
      final response = await http.get(uri);
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }
}
