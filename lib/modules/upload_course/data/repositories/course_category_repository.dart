import '../../models/course_init/course_category_model.dart';
import '../providers/course_category_provider.dart';

class CourseCategoryRepository {
  //Get All Course Categories by Domain id
  static Future<Map<String, String>> allCategoriesOfADomain(
      {required String domainId}) async {
    final response =
        await CourseCategoryProvider.courseCategoriesByDomain(domainId);
    final courseCategories =
        CourseCategoryModel.courseCategoryMapFromResponse(response.body);

    return courseCategories;
  }
}
