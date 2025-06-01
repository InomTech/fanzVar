// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../utilities/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SongTab2 extends StatefulWidget {
  const SongTab2({super.key});

  @override
  State<SongTab2> createState() => _SongTab2State();
}

class _SongTab2State extends State<SongTab2> with TickerProviderStateMixin {
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
    return BlocConsumer<FanBookCubit, FanBookStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final fanBookCubit = BlocProvider.of<FanBookCubit>(context);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: fanBookCubit.songsList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => songsItemBuilder(
                            fanBookCubit.songsList[index], index),
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .03,
                    right: MediaQuery.of(context).size.width * .03),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: lightBlackColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          fanBookCubit.songsList[fanBookCubit.songIndex]
                              ['image'],
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.modulate,
                          color: primaryColor,
                        ),
                      ),
                      expandedText(
                          text: fanBookCubit.songsList[fanBookCubit.songIndex]
                              ['title'],
                          textAlign: TextAlign.center,
                          maxLiens: 1),
                      Slider(
                          activeColor: primaryColor,
                          value: height,
                          min: 0,
                          max: fanBookCubit.songsList[fanBookCubit.songIndex]
                              ['end_of_song'],
                          onChanged: (value) {
                            setState(() {
                              height = value;
                              print(height);
                            });
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: primaryColor,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  if (player.playing == false) {
                                    player.play();
                                  } else {
                                    player.pause();
                                  }
                                },
                                icon: Icon(
                                  Icons.fast_rewind_rounded,
                                  color: primaryColor,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  if (player.playing == false) {
                                    player.play();
                                  } else {
                                    player.pause();
                                  }
                                },
                                icon: Icon(
                                  Icons.pause,
                                  color: primaryColor,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  if (player.playing == false) {
                                    player.play();
                                  } else {
                                    player.pause();
                                  }
                                },
                                icon: Icon(
                                  Icons.fast_forward_rounded,
                                  color: primaryColor,
                                )),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.queue_music_outlined,
                                  color: primaryColor,
                                )),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              )
            ],
          );
        });
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
              GestureDetector(
                onTap: () {
                  if (player.playing == false) {
                    player.play();
                  } else {
                    player.pause();
                  }
                  // FanBookCubit.get(context).songIndexFun(index);
                  // print(FanBookCubit.get(context).songIndex);
                  // print(index);
                },
                child: Icon(
                  Icons.play_arrow_outlined,
                  size: 40,
                  color: primaryColor,
                ),
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
