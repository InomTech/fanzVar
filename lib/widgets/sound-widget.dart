// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/modules/fan_book/notifiers/play_button_notifier.dart';
import 'package:fanzhashem/modules/fan_book/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../utilities/colors.dart';

class Sound extends StatefulWidget {
  final sound;
  final songsList;
  final PageManager pageManager;

  const Sound(
      {this.songsList, this.sound, required this.pageManager, super.key});

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> with TickerProviderStateMixin {
  final player = AudioPlayer();
  Duration currentDuration = Duration(milliseconds: 1000);
  bool showRemaining = false;
  late AnimationController controller;
  late final duration;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    setplay();
    controller.repeat(reverse: true);
    super.initState();
  }

  setplay() async {
    duration = await player.setUrl(//widget.sound['video_linke'] ??
        "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double height = 0;
  @override
  Widget build(BuildContext context) {
    // print(widget.sound);
    // print(widget.songsList);
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [songsItemBuilder(widget.sound, 1)],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(
        //       left: MediaQuery.of(context).size.width * .03,
        //       right: MediaQuery.of(context).size.width * .03),
        //   child: Container(
        //     height: MediaQuery.of(context).size.height * 0.25,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //         color: lightBlackColor,
        //         borderRadius: BorderRadius.circular(15)),
        //     child: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Column(children: [
        //         ClipRRect(
        //           borderRadius: BorderRadius.circular(100.0),
        //           child: Image.network(
        //             widget.sound['image'],
        //             width: 55,
        //             height: 55,
        //             fit: BoxFit.cover,
        //             colorBlendMode: BlendMode.modulate,
        //             color: primaryColor,
        //           ),
        //         ),
        //         expandedText(
        //             text: widget.sound['title'],
        //             textAlign: TextAlign.center,
        //             maxLiens: 1),
        //         Slider(
        //             activeColor: primaryColor,
        //             value: height,
        //             min: 0,
        //             max: 2.5,
        //             onChanged: (value) {
        //               setState(() {
        //                 height = value;
        //                 print(height);
        //               });
        //             }),
        //         Row(
        //           children: [
        //             Expanded(
        //               child: IconButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   icon: Icon(
        //                     Icons.favorite_border_rounded,
        //                     color: primaryColor,
        //                   )),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   icon: Icon(
        //                     Icons.fast_rewind_rounded,
        //                     color: primaryColor,
        //                   )),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                   onPressed: () async {
        //                     if (player.playing == false) {
        //                       player.play();
        //                     } else {
        //                       player.pause();
        //                     }
        //                   },
        //                   icon: Icon(
        //                     Icons.pause,
        //                     color: primaryColor,
        //                   )),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   icon: Icon(
        //                     Icons.fast_forward_rounded,
        //                     color: primaryColor,
        //                   )),
        //             ),
        //             Expanded(
        //               child: IconButton(
        //                   onPressed: () {
        //                     print('object');
        //                   },
        //                   icon: Icon(
        //                     Icons.queue_music_outlined,
        //                     color: primaryColor,
        //                   )),
        //             )
        //           ],
        //         )
        //       ]),
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget songsItemBuilder(item, int index) => Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            top: 5,
            right: MediaQuery.of(context).size.width * .02),
        child: Row(children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  item['image'],
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.modulate,
                  color: primaryColor.withOpacity(0.7),
                  // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.modulate,
                ),
              ),
              ValueListenableBuilder<Map<dynamic, dynamic>>(
                valueListenable: widget.pageManager.currentSongNotifier,
                builder: (_, value, __) {
                  final isCurrentSong = value['id'] == item['id'];
                  return ValueListenableBuilder<ButtonState>(
                    valueListenable: widget.pageManager.playButtonNotifier,
                    builder: (_, value, __) {
                      if (isCurrentSong && ButtonState.playing == value) {
                        return IconButton(
                          icon: Icon(Icons.pause),
                          iconSize: 40.0,
                          color: primaryColor,
                          onPressed: widget.pageManager.pause,
                        );
                      } else {
                        return IconButton(
                          icon: Icon(Icons.play_arrow),
                          iconSize: 40.0,
                          color: primaryColor,
                          onPressed: widget.pageManager.play,
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          expandedText(
              text: item['title'], textAlign: TextAlign.start, maxLiens: 2),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ]),
      );

  Widget expandedText({
    required String text,
    required textAlign,
    required int maxLiens,
  }) =>
      Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            maxLines: maxLiens,
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
}
