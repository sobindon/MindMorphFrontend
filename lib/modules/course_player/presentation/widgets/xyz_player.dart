import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class XYZPlayer extends StatefulWidget {
  const XYZPlayer({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<XYZPlayer> createState() => _XYZPlayerState();
}

class _XYZPlayerState extends State<XYZPlayer> {
  late BetterPlayerController _betterPlayerController;
  final _configuration = const BetterPlayerConfiguration(
    autoDetectFullscreenDeviceOrientation: true,
    fit: BoxFit.contain,
    autoPlay: true,
    autoDispose: true,
  );

  @override
  void initState() {
    super.initState();
    _setupVideoPlayer(widget.videoUrl);
  }

  @override
  void didUpdateWidget(XYZPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _betterPlayerController.dispose();
      _setupVideoPlayer(widget.videoUrl);
    }
  }

  void _setupVideoPlayer(String videoUrl) {
    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
    );
    _betterPlayerController = BetterPlayerController(
      _configuration,
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(
      controller: _betterPlayerController,
    );
  }
}
