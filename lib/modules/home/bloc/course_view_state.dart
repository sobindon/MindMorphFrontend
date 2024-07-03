part of 'course_view_bloc.dart';

@immutable
sealed class CourseViewState {}

final class CourseViewInitial extends CourseViewState {}

final class CourseViewSuccess extends CourseViewState {
  final List<CourseViewModel> trendingCourses;
  final List<CourseViewModel> newCourses;

  CourseViewSuccess({required this.trendingCourses, required this.newCourses});
}

final class CourseViewFailure extends CourseViewState {
  final String errorMessage;

  CourseViewFailure(this.errorMessage);
}

final class CourseViewFetching extends CourseViewState {}
