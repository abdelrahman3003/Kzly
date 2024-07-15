import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideoCourse extends StatefulWidget {
  const ShowVideoCourse({super.key});

  @override
  State<ShowVideoCourse> createState() => _ShowVideoCourseState();
}

class _ShowVideoCourseState extends State<ShowVideoCourse> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
          ..initialize().then((_) {
            setState(() {
              flickManager.flickControlManager?.pause();
            });
          }));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Center(
        child: FlickVideoPlayer(flickManager: flickManager),
      ),
    );
  }
}
