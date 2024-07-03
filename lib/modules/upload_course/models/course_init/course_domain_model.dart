import 'dart:convert';

// String courseDomainModelToJson(List<CourseDomainModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseDomainModel {
  int id;
  String name;

  CourseDomainModel({
    required this.id,
    required this.name,
  });

  factory CourseDomainModel._fromJson(Map<String, dynamic> json) =>
      CourseDomainModel(
        id: json["id"],
        name: json["name"],
      );

  static List<CourseDomainModel> courseDomainModelFromResponse(String str) =>
      List<CourseDomainModel>.from(
          json.decode(str).map((x) => CourseDomainModel._fromJson(x)));

  static Map<String, String> courseDomainMapFromResponse(String str) {
    List<dynamic> decodedJson = json.decode(str);
    Map<String, String> courseMap = {};
    for (var item in decodedJson) {
      CourseDomainModel course = CourseDomainModel._fromJson(item);
      courseMap[course.id.toString()] = course.name;
    }
    return courseMap;
  }

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //     };
}
