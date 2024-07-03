// lib/bloc/list_fetch_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../data/providers/course_initialize_submit_provider.dart';
// import '../../../models/course_initialize_submit_model.dart';
import 'list_fetch_event.dart';
import 'list_fetch_state.dart';
import '../../data/repositories/course_domain_repository.dart';
import '../../data/repositories/course_category_repository.dart';

class ListFetchBloc extends Bloc<ListFetchEvent, ListFetchState> {
  // late Map<String, String> courseDomains;
  late Map<String, String> courseDomains;
  ListFetchBloc() : super(ListFetchInitial()) {
    on<FetchList1>((event, emit) async {
      emit(ListFetchLoading());
      try {
        courseDomains = await CourseDomainRepository.allDomain();
        // xyz = courseDomains;
        emit(ListFetchLoaded(
            courseDomains: courseDomains, courseCategories: const {}));
      } catch (e) {
        emit(ListFetchError(message: e.toString()));
      }
    });

    on<FetchList2>((event, emit) async {
      emit(ListFetchLoading());
      try {
        final courseCategories =
            await CourseCategoryRepository.allCategoriesOfADomain(
                domainId: event.courseDomainId);
        if (state is ListFetchLoaded) {
          emit(ListFetchLoaded(
              courseDomains:
                  courseDomains, //(state as ListFetchLoaded).courseDomains,
              courseCategories: courseCategories));
        } else {
          emit(ListFetchLoaded(
              courseDomains: courseDomains,
              courseCategories: courseCategories));
        }
      } catch (e) {
        emit(ListFetchError(message: e.toString()));
      }
    });

    on<SubmitSelections>((event, emit) async {
      emit(SubmissionLoading());
      try {
        // final model = CourseInitializeSubmitModel(
        //     courseCategoryId: event.courseCategoryId,
        //     courseDomainId: event.courseDomainId);
        // await courseInitializationSubmit(model);
        emit(SubmissionSuccess());
      } catch (e) {
        emit(SubmissionError(message: e.toString()));
      }
    });
  }
}
