import 'dart:convert';

// String courseSectionResponseModelToJson(List<CourseSectionResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseSectionResponseModel {
  String id;
  String title;
  List<Lecture> lectures;
  int orderPriority;

  CourseSectionResponseModel(
      {required this.id,
      required this.title,
      required this.lectures,
      required this.orderPriority});

  factory CourseSectionResponseModel._fromJson(Map<String, dynamic> json) =>
      CourseSectionResponseModel(
        id: json["_id"],
        title: json["title"],
        lectures: List<Lecture>.from(
            json["lectures"].map((x) => Lecture._fromJson(x))),
        orderPriority: json["orderPriority"],
      );

  static List<CourseSectionResponseModel> fromResponse(String str) =>
      List<CourseSectionResponseModel>.from(
          json.decode(str).map((x) => CourseSectionResponseModel._fromJson(x)));

  // Map<String, dynamic> toJson() => {
  //     "_id": id,
  //     "title": title,
  //     "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
  //     "orderPriority": orderPriority
  // };
}

class Lecture {
  String id;
  String title;
  String file;
  int size;
  List<Subtitle> subtitles;
  double duration;
  bool isAttachment;
  int orderPriority;

  Lecture(
      {required this.id,
      required this.title,
      required this.file,
      required this.size,
      required this.subtitles,
      required this.duration,
      required this.isAttachment,
      required this.orderPriority});

  factory Lecture._fromJson(Map<String, dynamic> json) => Lecture(
      id: json["_id"],
      title: json["title"],
      file: json["file"],
      size: json["size"],
      subtitles: List<Subtitle>.from(
          json["subtitles"].map((x) => Subtitle._fromJson(x))),
      duration: json["duration"]?.toDouble(),
      isAttachment: json["isAttachment"],
      orderPriority: json["orderPriority"]);

  // Map<String, dynamic> toJson() => {
  //     "_id": id,
  //     "title": title,
  //     "file": file,
  //     "size": size,
  //     "subtitles": List<dynamic>.from(subtitles.map((x) => x.toJson())),
  //     "duration": duration,
  //     "isAttachment": isAttachment,
  //     "orderPriority": orderPriority
  // };
}

class Subtitle {
  String language;
  String link;
  String id;

  Subtitle({
    required this.language,
    required this.link,
    required this.id,
  });

  factory Subtitle._fromJson(Map<String, dynamic> json) => Subtitle(
        language: json["language"],
        link: json["link"],
        id: json["_id"],
      );

  // Map<String, dynamic> toJson() => {
  //     "language": language,
  //     "link": link,
  //     "_id": id,
  // };
}
