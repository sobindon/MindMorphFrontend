import 'course_data_model.dart';
import 'course_view_model.dart';

class CourseCarasoulData {
  Author author;
  double discountPercent;
  int id;
  int price;
  double rating;
  String title;
  String courseThumbnailUrl;
  CourseCarasoulData({
    required this.author,
    required this.discountPercent,
    required this.id,
    required this.price,
    required this.rating,
    required this.title,
    required this.courseThumbnailUrl,
  });

  static List<CourseCarasoulData> getCarasoulDataList(
      List<CourseViewModel> coursesView,
      Map<int, CourseDataModel> coursesData) {
    List<CourseCarasoulData> carasoulDataList = [];

    for (CourseViewModel course in coursesView) {
      // if (!coursesData.containsKey(course.id)) return [];
      CourseDataModel courseData = coursesData[course.id] ??
          CourseDataModel(
              courseId: course.id, courseThumbnailUrl: '', title: '');
      final carasoulData = CourseCarasoulData(
        author: course.author,
        courseThumbnailUrl: courseData.courseThumbnailUrl,
        discountPercent: course.discountPercent,
        id: course.id,
        price: course.price,
        rating: course.rating,
        title: courseData.title,
      );
      carasoulDataList.add(carasoulData);
    }
    return carasoulDataList;
  }
}
