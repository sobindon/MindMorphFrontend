import 'dart:convert';

class CourseByInstructorIdModel {
  int id;
  double price;

  CourseByInstructorIdModel({
    required this.id,
    required this.price,
  });

  factory CourseByInstructorIdModel._fromJson(Map<String, dynamic> json) =>
      CourseByInstructorIdModel(
        id: json["id"],
        price: json["price"].toDouble(),
      );

  static List<CourseByInstructorIdModel> fromResponse(String response) =>
      List<CourseByInstructorIdModel>.from(json
          .decode(response)
          .map((x) => CourseByInstructorIdModel._fromJson(x)));

  static String modelsToJsonRequestBody(
      List<CourseByInstructorIdModel> models) {
    final courseIds = models.map((model) => model.id).toList();

    return json.encode({'courseIds': courseIds});
  }

  static Map<int, double> modelsToMap(List<CourseByInstructorIdModel> models) {
    final Map<int, double> mapData = {}; //id:price
    for (var model in models) {
      mapData[model.id] = model.price;
    }
    return mapData;
  }
}
