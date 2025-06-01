// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utilities/colors.dart';

class VedioComponent extends StatefulWidget {
  final vedio;

  const VedioComponent({required this.vedio, super.key});

  @override
  State<VedioComponent> createState() => _VedioComponentState();
}

class _VedioComponentState extends State<VedioComponent> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.vedio['video_linke'])
      ..initialize().then((_) {
        setState(() {});
      });
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async {
                setState(() {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                });
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 0),
                    // width: width * .7,
                    // height: height / 4 - 20,
                    child: controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          )
                        : Container(),
                  ),
                  InkWell(
                      onTap: () async {
                        setState(() {
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        });
                      },
                      child: !controller.value.isPlaying
                          ? Icon(
                              Icons.play_arrow,
                            )
                          : SizedBox()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.vedio['title'],
              style: TextStyle(
                // color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
