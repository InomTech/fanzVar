import 'package:fanzhashem/modules/fan_book/vedio_component.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SongsTab extends StatefulWidget {
  final List vediosList;

  const SongsTab({required this.vediosList, super.key});

  @override
  State<SongsTab> createState() => _SongsTabState();
}

class _SongsTabState extends State<SongsTab> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.asset("assets/vedio/bee.mp4")
    //   ..initialize().then((_) {
    //     controller.play();

    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });

    // controller = VideoPlayerController.network(this.playList[0])
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
    // controller = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    //   ..initialize().then((_) {
    //     controller.play();

    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: widget.vediosList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext ctx, int index) {
        return VedioComponent(vedio: widget.vediosList[index]);
      },
    );
    // return Scaffold(
    //   body: Container(
    //     height: height * .2,
    //     width: width * 0.8,
    //     color: Colors.blue,
    //     child: Center(
    //       child: controller.value.isInitialized
    //           ? AspectRatio(
    //               aspectRatio: controller.value.aspectRatio,
    //               child: VideoPlayer(controller),
    //             )
    //           : Container(),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState(() {
    //         controller.value.isPlaying ? controller.pause() : controller.play();
    //       });
    //     },
    //     child: Icon(
    //       controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //     ),
    //   ),
    // );
  }
}
