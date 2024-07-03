part of 'course_view_bloc.dart';

@immutable
sealed class CourseViewEvent {}

final class CoursesFetched extends CourseViewEvent {
  // final List<CourseViewModel> courses;

  // CoursesFetched({required this.courses});
}
