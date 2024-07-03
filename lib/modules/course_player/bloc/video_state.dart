import 'package:equatable/equatable.dart';

class VideoState extends Equatable {
  final String videoUrl;

  const VideoState({required this.videoUrl});

  @override
  List<Object> get props => [videoUrl];
}
