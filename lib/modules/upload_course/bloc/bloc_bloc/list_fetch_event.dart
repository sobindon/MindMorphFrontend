// lib/bloc/list_fetch_event.dart

import 'package:equatable/equatable.dart';

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
  final String courseCategoryId;
  final String courseDomainId;

  SubmitSelections(
      {required this.courseCategoryId, required this.courseDomainId});

  @override
  List<Object> get props => [courseCategoryId, courseDomainId];
}
