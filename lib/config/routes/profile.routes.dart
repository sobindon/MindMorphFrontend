import 'package:go_router/go_router.dart';
// import '../../modules/upload_course/presentation/screens/create_course.dart'
import '../../modules/profile/screens/instrcutor_profile_screen.dart';
import '../../modules/profile/screens/instructor_page/instructor_course_list.dart';
import '../../modules/course_player/coursevideo.dart';

List<RouteBase> profileRoutes = [
  GoRoute(
    name: 'listInstructorcourse',
    path: '/listInstructorcourse',
    builder: (context, state) => ListInstructorCourse(),
  ),
  GoRoute(
    name: 'Instructpage',
    path: '/Instructpage',
    builder: (context, state) => const Instructpage(),
  ),
  GoRoute(
    name: 'instrcutorAccount',
    path: '/instrcutorAccount',
    builder: (context, state) => const InstrcutorProfile(),
  ),
];
