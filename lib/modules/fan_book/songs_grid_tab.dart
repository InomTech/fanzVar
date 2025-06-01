import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../utilities/colors.dart';

class SongsGridTab extends StatefulWidget {
  final List songsList;

  const SongsGridTab({required this.songsList, super.key});

  @override
  State<SongsGridTab> createState() => _SongsGridTabState();
}

class _SongsGridTabState extends State<SongsGridTab>
    with TickerProviderStateMixin {
  final audioPlayer = AudioPlayer();
  Duration currentDuration = Duration(milliseconds: 1000);
  bool showRemaining = false;
  late AnimationController controller;
  late ConcatenatingAudioSource playlist;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    // setplay();
    setInitialPlaylist();
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final duration;
  setplay() async {
    duration = await audioPlayer.setUrl(// Load a URL
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3');
  }

  void setInitialPlaylist() async {
    const prefix = 'https://www.soundhelix.com/examples/mp3';
    final song1 = Uri.parse('$prefix/SoundHelix-Song-1.mp3');
    final song2 = Uri.parse(
        'http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3');
    final song3 = Uri.parse('$prefix/SoundHelix-Song-3.mp3');
    playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(song1, tag: 'Song 1'),
      AudioSource.uri(song2, tag: 'Song 2'),
      AudioSource.uri(song3, tag: 'Song 3'),
    ]);
    await audioPlayer.setAudioSource(playlist);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return widget.songsList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: widget.songsList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height * 0.165,
                  width: width,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: InkWell(
                          onTap: () async {
                            if (audioPlayer.playing == false) {
                              audioPlayer.play();
                            } else {
                              audioPlayer.pause();
                              audioPlayer.seekToNext();
                            }
                          },
                          child: Image.network(
                            widget.songsList[index]['image'],
                            height: height * 0.13,
                            width: width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.015),
                      SizedBox(
                        width: width * 0.5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.songsList[index]['title'],
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(height: width * 0.015),
                            Text(
                              widget.songsList[index]['club_name'],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(height: width * 0.015),
                            Text(
                              widget.songsList[index]['description'],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            // Text(
                            //   widget.songsList[index]['video_linke'],
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 12,
                            //       overflow: TextOverflow.ellipsis),
                            // ),
                            // Text(
                            //   "sponser:${widget.songsList[index]['sponser']}",
                            //   style: TextStyle(
                            //     color: primaryColor,
                            //     fontSize: 12,
                            //   ),
                            // ),
                            SizedBox(height: width * 0.030),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.favorite_border_outlined,
                                      color: darkGoldColor,
                                    ),
                                    Text(
                                      "100",
                                      style: TextStyle(fontSize: 9),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.subdirectory_arrow_right,
                                      color: darkGoldColor,
                                    ),
                                    Text(
                                      "95",
                                      style: TextStyle(fontSize: 9),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      color: darkGoldColor,
                                    ),
                                    Text(
                                      "50",
                                      style: TextStyle(fontSize: 9),
                                    )
                                  ],
                                ),
                                SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                    ],
                  ),
                  //  Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     ListTile(
                  //       leading: InkWell(
                  //         onTap: () async {
                  //           if (player.playing == false) {
                  //             player.play();
                  //             await player.setVolume(0.9);
                  //           } else {
                  //             player.pause();
                  //           }
                  //         },
                  //         child: Image(
                  //           height: 200,
                  //           width: width * 0.3,
                  //           image:
                  //               NetworkImage(widget.songsList[index]['image']),
                  //           fit: BoxFit.fill,
                  //         ),
                  //       ),
                  //       title: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               widget.songsList[index]['title'],
                  //               style: TextStyle(
                  //                   color: primaryColor,
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //             Text(
                  //               widget.songsList[index]['club_name'],
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontSize: 15,
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //             Text(
                  //               widget.songsList[index]['description'],
                  //               style: TextStyle(
                  //                 // color: Colors.grey,
                  //                 fontSize: 13,
                  //               ),
                  //             ),
                  //             // Text(widget.songsList[index]['video_linke']),
                  //             // Text(
                  //             //   "sponser:${widget.songsList[index]['sponser']}",
                  //             //   style: TextStyle(
                  //             //     color: primaryColor,
                  //             //   ),
                  //             // ),
                  //           ],
                  //         ),
                  //       ),
                  //       // subtitle: Text(widget.songsList[index]['match_name']),
                  //     ),
                  //   ],
                  // ),
                ),
              );
            },
          );
  }
}
