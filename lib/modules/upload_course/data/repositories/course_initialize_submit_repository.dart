import '../../models/course_init/response_model.dart';
import '../../models/course_init/submit_model.dart';
import '../providers/course_initialize_submit_provider.dart';

class CourseInitializeSubmitRepository {
  //Get All Course Categories by Domain id
  static Future<InitCourseResponseModel> send(
      CourseInitializeSubmitModel data) async {
    final response = await courseInitializationSubmit(data);
    final courseInitResponse =
        InitCourseResponseModel.fromResponse(response.body);

    return courseInitResponse;
  }
}
