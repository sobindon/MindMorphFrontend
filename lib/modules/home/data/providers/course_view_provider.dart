import 'package:http/http.dart' as http;
import '/constants/urls.dart';

class CourseViewProvider {
  static String quantityFeatchPerCarasoul = '3';
  static Future<http.Response> thumbnailsAndTitles(String requestBody) async {
    final uri = Uri.http(COURSE_SERVER, '/courses/titleAndThumbnail');

    try {
      final response = await http.post(uri,
          headers: {'Content-type': 'application/json'}, body: requestBody);

      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }

  static Future<http.Response> trendingCourses() async {
    final uri = Uri.http(
        NODE_SERVER, '/course/trending', {'qty': quantityFeatchPerCarasoul});

    try {
      final response = await http.get(uri);
      // if (response.statusCode != 200) throw 'Failed to Fetch Trending Courses';
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }

  static Future<http.Response> newCourses() async {
    final uri = Uri.http(
        NODE_SERVER, '/course/latest', {'qty': quantityFeatchPerCarasoul});

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) throw 'Failed to Fetch New Courses';
      return response;
    } catch (e) {
      throw 'Failed on Connecting to Server: ${e.toString()}';
    }
  }
}
