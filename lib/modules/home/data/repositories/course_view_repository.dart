import '../providers/course_view_provider.dart';
import '../../models/course_view_model.dart';

class CourseViewRepository {
  //Get Trending Courses
  static Future<List<CourseViewModel>> trendingCourses() async {
    final response = await CourseViewProvider.trendingCourses();
    final courses = CourseViewModel.courseViewsFromResponseBody(response.body);
    return courses;
  }

  //Get New/Latest Courses
  static Future<List<CourseViewModel>> newCourses() async {
    final response = await CourseViewProvider.trendingCourses();
    final courses = CourseViewModel.courseViewsFromResponseBody(response.body);
    return courses;
  }
}
