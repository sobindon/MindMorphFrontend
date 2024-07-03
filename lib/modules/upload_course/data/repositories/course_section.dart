import '../../models/course_section/add_section_request.dart';
import '../../models/course_section/add_section_response.dart';
import '../../models/course_section/section_preview_response.dart';
import '../../models/course_section/upload_lecture.dart';
import '../providers/course_section.dart';

class CourseSectionRepository {
  static Future<AddSectionResponseModel> addSection(
      AddSectionRequestModel data) async {
    final response = await CourseSectionProvider.addSection(data.toJson());
    final addSectionResponse =
        AddSectionResponseModel.fromResponse(response.body);

    return addSectionResponse;
  }

  static Future<List<CourseSectionResponseModel>> previewSection(
      {required int courseId}) async {
    final response = await CourseSectionProvider.previewSection(courseId);
    final previewSectionResponse =
        CourseSectionResponseModel.fromResponse(response.body);

    return previewSectionResponse;
  }

  // Upload Lecture
  static Future<bool> uploadLecture(UploadLectureData data) async {
    final response = await CourseSectionProvider.uploadLecture(data);

    // final result = CourseCreateResponseModel.fromResponse(response);
    // return result;
    return response.statusCode == 201;
  }
}
