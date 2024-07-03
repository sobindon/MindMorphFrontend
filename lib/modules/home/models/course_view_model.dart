// To parse this JSON data, do
//
//     final homePageCourseModel = homePageCourseModelFromJson(jsonString);

import 'dart:convert';

// String homePageCourseModelToJson(List<HomePageCourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseViewModel {
  int id;
  String title;
  String thumbnail;
  int rating;
  int price;

  CourseViewModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.price,
  });

  factory CourseViewModel._fromJson(Map<String, dynamic> json) {
    try {
      return CourseViewModel(
        id: json['id'],
        title: json["title"],
        thumbnail: json["thumbnail"],
        rating: json["rating"] ?? 5,
        price: json["price"],
      );
    } catch (e) {
      // ignore: avoid_print
      print('Error occured while parsing CourseViewModel, $e');
      throw 'Error occured: ${e.toString()}';
    }
  }

  static List<CourseViewModel> courseViewsFromResponseBody(String str) =>
      List<CourseViewModel>.from(
          json.decode(str).map((x) => CourseViewModel._fromJson(x)));

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       "title": title,
  //       "thumbnail": thumbnail,
  //       "rating": rating,
  //       "price": price,
  //     };
}
