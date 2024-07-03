part of 'course_initialize_bloc.dart';

// @immutable
// sealed class CourseInitializeState {}
// // lib/bloc/list_fetch_state.dart

abstract class ListFetchState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListFetchInitial extends ListFetchState {}

class ListFetchLoading extends ListFetchState {}

class ListFetchLoaded extends ListFetchState {
  final Map<String, String> courseDomains;
  final Map<String, String> courseCategories;

  ListFetchLoaded(
      {required this.courseDomains, required this.courseCategories});

  @override
  List<Map<String, String>> get props => [courseDomains, courseCategories];
}

class ListFetchError extends ListFetchState {
  final String message;

  ListFetchError({required this.message});

  @override
  List<Object> get props => [message];
}

class SubmissionLoading extends ListFetchState {}

class SubmissionSuccess extends ListFetchState {
  final InitCourseResponseModel courseInitResponse;

  SubmissionSuccess({required this.courseInitResponse});
  @override
  List<Object> get props => [courseInitResponse];
}

class SubmissionError extends ListFetchState {
  final String message;

  SubmissionError({required this.message});

  @override
  List<Object> get props => [message];
}
