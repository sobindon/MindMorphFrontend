import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
}

class VideoUrlChanged extends VideoEvent {
  final String videoUrl;

  const VideoUrlChanged(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}
