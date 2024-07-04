// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseViewModel {
  Author author;
  double discountPercent;
  int id;
  int price;
  double rating;

  CourseViewModel({
    required this.author,
    required this.discountPercent,
    required this.id,
    required this.price,
    required this.rating,
  });

  factory CourseViewModel._fromJson(Map<String, dynamic> json) =>
      CourseViewModel(
        author: Author.fromJson(json["author"]),
        discountPercent: json["discountPercent"] != null
            ? (json["discountPercent"] * 10) / 10
            : 0.0,
        id: json["id"],
        price: json["price"],
        rating: json["rating"] != null ? (json["rating"] * 10) / 10 : 0.0,
      );

  static List<CourseViewModel> fromResponseBody(String str) =>
      List<CourseViewModel>.from(
          json.decode(str).map((x) => CourseViewModel._fromJson(x)));

  static String getIdsJsonList(List<CourseViewModel> courses) {
    final ids = courses.map((course) => course.id).toList();
    return jsonEncode({'courseIds': ids});
  }
}

class Author {
  String fullName;

  Author({
    required this.fullName,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
      };
}
