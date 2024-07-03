// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_initialize_bloc.dart';

abstract class ListFetchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchList1 extends ListFetchEvent {}

class FetchList2 extends ListFetchEvent {
  final String courseDomainId;

  FetchList2({required this.courseDomainId});

  @override
  List<Object> get props => [courseDomainId];
}

class SubmitSelections extends ListFetchEvent {
  final CourseInitializeSubmitModel dataToSubmit;

  SubmitSelections({
    required this.dataToSubmit,
  });

  @override
  List<Object> get props => [dataToSubmit];
}
