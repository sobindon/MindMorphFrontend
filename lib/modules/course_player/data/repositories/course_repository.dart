// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/course_details.dart';
import '../../models/course_model.dart';
import '../providers/course_provider.dart';

class _CourseRepository {
  //Get a Course from courseId
  static Future<CourseModel> getCourse(int courseId) async {
    final response = await CourseProvider.getCourse(courseId);
    final course = CourseModel.fromResponse(response.body);
    return course;
  }

  static Future<CourseDetailsModel> getCourseDetail(int courseId) async {
    final response = await CourseProvider.getCourseDetails(courseId);
    final courseDetail = CourseDetailsModel.fromResponseBody(response.body);
    return courseDetail;
  }
}

class CourseResponse {
  CourseModel course;
  CourseDetailsModel courseDetails;
  CourseResponse({
    required this.course,
    required this.courseDetails,
  });

  static Future<CourseResponse> getData(int courseId) async {
    final course = await _CourseRepository.getCourse(courseId);
    final courseDetails = await _CourseRepository.getCourseDetail(courseId);
    final response =
        CourseResponse(course: course, courseDetails: courseDetails);
    return response;
  }
}
