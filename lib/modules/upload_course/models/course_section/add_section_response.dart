import 'dart:convert';

class AddSectionResponseModel {
  String title;
  int orderPriority;
  String id;

  AddSectionResponseModel({
    required this.title,
    required this.orderPriority,
    required this.id,
  });

  factory AddSectionResponseModel.fromResponse(String str) {
    final jsonData = json.decode(str);
    return AddSectionResponseModel(
      title: jsonData["title"],
      orderPriority: jsonData["orderPriority"],
      id: jsonData["_id"],
    );
  }
}
