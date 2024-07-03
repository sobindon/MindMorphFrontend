// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseInitializeSubmitModel {
  int courseCategoryId;
  int authorId;
  String language;
  double price;

  CourseInitializeSubmitModel({
    required this.courseCategoryId,
    required this.authorId,
    required this.language,
    required this.price,
  });

  String toJson() => json.encode(toMap());

  // CourseInitializeSubmitModel copyWith({
  //   int? courseCategoryId,
  //   int? authorId,
  //   String? language,
  //   double? price,
  // }) {
  //   return CourseInitializeSubmitModel(
  //     courseCategoryId: courseCategoryId ?? this.courseCategoryId,
  //     authorId: authorId ?? this.authorId,
  //     language: language ?? this.language,
  //     price: price ?? this.price,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseCategoryId': courseCategoryId,
      'authorId': authorId,
      'language': language,
      'price': price,
    };
  }

  // factory CourseInitializeSubmitModel.fromMap(Map<String, dynamic> map) {
  //   return CourseInitializeSubmitModel(
  //     courseCategoryId: map['courseCategoryId'] as int,
  //     authorId: map['authorId'] as int,
  //     language: map['language'] as String,
  //     price: map['price'] as double,
  //   );
  // }

  // factory CourseInitializeSubmitModel.fromJson(String source) => CourseInitializeSubmitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseInitializeSubmitModel(courseCategoryId-> value: ${courseCategoryId} type: ${courseCategoryId.runtimeType}\n authorId-> value: ${authorId} type: ${authorId.runtimeType}\n , language-> value: ${language} type: ${language.runtimeType}\n price-> value: ${price} type: ${price.runtimeType})';
  }

  // @override
  // bool operator ==(covariant CourseInitializeSubmitModel other) {
  //   if (identical(this, other)) return true;

  //   return
  //     other.courseCategoryId == courseCategoryId &&
  //     other.authorId == authorId &&
  //     other.language == language &&
  //     other.price == price;
  // }

  // @override
  // int get hashCode {
  //   return courseCategoryId.hashCode ^
  //     authorId.hashCode ^
  //     language.hashCode ^
  //     price.hashCode;
  // }
}
