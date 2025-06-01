import 'package:fanzhashem/modules/fan_book/songs_one_tab.dart';
import 'package:fanzhashem/widgets/sound-widget.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../utilities/colors.dart';

class SongsThirdTab extends StatefulWidget {
  final List songsList;

  const SongsThirdTab({required this.songsList, super.key});

  @override
  State<SongsThirdTab> createState() => _SongsThirdTabState();
}

class _SongsThirdTabState extends State<SongsThirdTab>
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
        : Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      tileColor: lightBlackColor,
                      leading: Icon(Icons.favorite, color: primaryColor),
                      title: Text('Likes'),
                    ),
                    ListTile(
                      tileColor: lightBlackColor,
                      leading: Icon(Icons.list, color: primaryColor),
                      title: Text('Play Lists'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Recently Played',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                ListView.builder(
                  itemCount: widget.songsList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext ctx, int index) {
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
                          child: Sound(
                            sound: widget.songsList[index],
                            songsList: widget.songsList,
                            pageManager: pageManager!,
                          )),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
