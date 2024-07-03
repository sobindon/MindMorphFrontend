import 'package:http/http.dart' as http;
import '/constants/urls.dart';

class CourseViewProvider {
  static Future<http.Response> trendingCourses() async {
    final uri = Uri.http(NODE_SERVER, '/course/trending');

    try {
      final response = await http.get(uri);
      // if (response.statusCode != 200) throw 'Failed to Fetch Trending Courses';
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }

  static Future<http.Response> newCourses() async {
    final uri = Uri.http(NODE_SERVER, '/course/latest');

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) throw 'Failed to Fetch New Courses';
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }
}
