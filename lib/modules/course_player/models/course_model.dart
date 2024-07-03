import 'dart:convert';

class CourseModel {
  int id;
  int courseCategoryId;
  int authorId;
  String language;
  int price;
  int discountPercent;
  double rating;
  int ratingCount;
  int enrollCount;
  DateTime createdAt;
  DateTime updatedAt;
  Author author;

  CourseModel({
    required this.id,
    required this.courseCategoryId,
    required this.authorId,
    required this.language,
    required this.price,
    required this.discountPercent,
    required this.rating,
    required this.ratingCount,
    required this.enrollCount,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  factory CourseModel._fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        courseCategoryId: json["courseCategoryId"],
        authorId: json["authorId"],
        language: json["language"],
        price: json["price"],
        discountPercent: json["discountPercent"] ?? 0,
        rating: json["rating"] ?? 0.0,
        ratingCount: json["ratingCount"],
        enrollCount: json["enrollCount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        author: Author._fromJson(json["author"]),
      );
  static CourseModel fromResponse(String str) =>
      CourseModel._fromJson(json.decode(str));
}

class Author {
  String fullName;

  Author({
    required this.fullName,
  });

  factory Author._fromJson(Map<String, dynamic> json) => Author(
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
      };
}
