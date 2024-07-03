import 'dart:convert';

// String courseCategoryModelToJson(List<CourseCategoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseCategoryModel {
  int id;
  String name;
  int courseDomainId;

  CourseCategoryModel({
    required this.id,
    required this.name,
    required this.courseDomainId,
  });

  static List<CourseCategoryModel> courseCategoryModelFromResponse(
          String str) =>
      List<CourseCategoryModel>.from(
          json.decode(str).map((x) => CourseCategoryModel._fromJson(x)));

  factory CourseCategoryModel._fromJson(Map<String, dynamic> json) =>
      CourseCategoryModel(
        id: json["id"],
        name: json["name"],
        courseDomainId: json["courseDomainId"],
      );

  static Map<String, String> courseCategoryMapFromResponse(String str) {
    List<dynamic> decodedJson = json.decode(str);
    Map<String, String> courseCategoryMap = {};
    for (var item in decodedJson) {
      CourseCategoryModel courseCategory = CourseCategoryModel._fromJson(item);
      courseCategoryMap[courseCategory.id.toString()] = courseCategory.name;
    }
    return courseCategoryMap;
  }

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "courseDomainId": courseDomainId,
  //     };
}
