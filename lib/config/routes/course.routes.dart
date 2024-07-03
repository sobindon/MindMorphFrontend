import 'package:go_router/go_router.dart';
// import '../../modules/upload_course/presentation/screens/addsection.dart';
import '../../modules/upload_course/presentation/screens/course_sections_screen.dart';
import '../../modules/upload_course/presentation/screens/init_course_screen.dart';
import '../../modules/upload_course/presentation/screens/create_course_screen.dart';
import '../../modules/upload_course/presentation/widgets/course_sections/add_section.dart';
import '../../modules/course_player/presentation/screens/course_dashboard.dart';

List<RouteBase> courseRoutes = [
  GoRoute(
    path: '/course/initialize',
    builder: (context, state) => const InitializeCourseScreen(),
  ),
  GoRoute(
    path: '/course/create/:courseId',
    builder: (context, state) {
      final courseId = state.pathParameters['courseId']; // may be null
      return AddCourseScreen(courseId: int.parse(courseId!));
    },
  ),
  GoRoute(
    path: '/course/sections/:courseId',
    builder: (context, state) {
      final courseId = state.pathParameters['courseId'];
      return CourseSections(courseId: int.parse(courseId!));
    },
  ),
  GoRoute(
    path: '/course/sections/add/:courseId',
    builder: (context, state) {
      final courseId = state.pathParameters['courseId'];
      return AddCourseSection(courseId: int.parse(courseId!));
    },
  ),
  GoRoute(
      path: '/course/dashboard/:courseId',
      builder: (context, state) {
        final courseId = state.pathParameters['courseId'];
        return CourseDashboard(courseId: int.parse(courseId!));
      }),
];
