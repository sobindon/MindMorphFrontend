import '../providers/course_domian_provider.dart';
import '../../models/course_init/course_domain_model.dart';

class CourseDomainRepository {
  //Get All Course Domains
  // static Future<List<CourseDomainModel>> allDomain() async {
  //   final response = await CourseDomainProvider.allCourseDomain();
  //   final courseDomains =
  //       CourseDomainModel.courseDomainModelFromResponse(response.body);
  //   return courseDomains;
  // }

  static Future<Map<String, String>> allDomain() async {
    final response = await CourseDomainProvider.allCourseDomain();
    final courseDomains =
        CourseDomainModel.courseDomainMapFromResponse(response.body);
    return courseDomains;
  }
}
