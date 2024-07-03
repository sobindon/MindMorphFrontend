import '../../models/course_create/request_model.dart';
import '../../models/course_create/response_model.dart';
import '../providers/course_create.dart';

class CourseCreateRepository {
  static Future<CourseCreateResponseModel> submit(
      CourseCreateRequestModel data) async {
    final response = await CourseCreateProvider.send(data);

    final result = CourseCreateResponseModel.fromResponse(response);
    return result;
  }
}
