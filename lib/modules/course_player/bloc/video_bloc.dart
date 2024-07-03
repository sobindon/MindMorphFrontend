import 'package:flutter_bloc/flutter_bloc.dart';
import 'video_event.dart';
import 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc(String initialUrl) : super(VideoState(videoUrl: initialUrl)) {
    on<VideoUrlChanged>((event, emit) {
      emit(VideoState(videoUrl: event.videoUrl));
    });
  }
}
