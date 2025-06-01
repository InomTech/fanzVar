// ignore_for_file: deprecated_member_use

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreenWidget extends StatefulWidget {
  const VideoScreenWidget({super.key, required this.url});

  final String url;

  @override
  State<StatefulWidget> createState() {
    return _VideoScreenWidgetState();
  }
}

class _VideoScreenWidgetState extends State<VideoScreenWidget> {
  late VideoPlayerController _videoPlayerController;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
