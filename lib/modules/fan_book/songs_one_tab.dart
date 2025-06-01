import 'package:fanzhashem/modules/fan_book/page_manager.dart';
import 'package:fanzhashem/widgets/sound-widget.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../utilities/colors.dart';
import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';

class SongsOneTab extends StatefulWidget {
  final List songsList;
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);
  SongsOneTab({required this.songsList, super.key});

  @override
  State<SongsOneTab> createState() => _SongsOneTabState();
}

class _SongsOneTabState extends State<SongsOneTab>
    with TickerProviderStateMixin {
  final player = AudioPlayer();
  Duration currentDuration = Duration(milliseconds: 1000);
  bool showRemaining = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    pageManager?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (widget.songsList.isNotEmpty)
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
          if (widget.songsList.isNotEmpty)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CurrentPlayedSong(songsList: widget.songsList),
            )
        ],
      ),
    );
  }
}

PageManager? pageManager;

class CurrentPlayedSong extends StatefulWidget {
  final List songsList;
  const CurrentPlayedSong({super.key, required this.songsList});

  @override
  State<CurrentPlayedSong> createState() => _CurrentPlayedSongState();
}

class _CurrentPlayedSongState extends State<CurrentPlayedSong> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    pageManager ??= PageManager(songsList: widget.songsList);
  }

  @override
  void dispose() {
    super.dispose();
    pageManager?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .03,
          right: MediaQuery.of(context).size.width * .03),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
            color: lightBlackColor, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                widget.songsList[0]['image'],
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.modulate,
                color: primaryColor,
              ),
            ),
            CurrentSongTitle(),
            AudioProgressBar(),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        print('object');
                      },
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: primaryColor,
                      )),
                ),
                Expanded(child: PreviousSongButton()),
                Expanded(child: PlayButton()),
                Expanded(child: NextSongButton()),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        print('object');
                      },
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
    );
  }
}

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({super.key});
  @override
  Widget build(BuildContext context) {
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
    return ValueListenableBuilder<String>(
      valueListenable: pageManager!.currentSongTitleNotifier,
      builder: (_, title, __) {
        return expandedText(
            text: title, textAlign: TextAlign.center, maxLiens: 1);
      },
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager!.progressNotifier,
      builder: (_, value, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),

        );
      },
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<String>>(
        valueListenable: pageManager!.playlistNotifier,
        builder: (context, playlistTitles, _) {
          return ListView.builder(
            itemCount: playlistTitles.length,
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
                      sound: playlistTitles[index],
                      songsList: playlistTitles,
                      pageManager: pageManager!,
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager!.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Icon(Icons.skip_previous, color: primaryColor),
          onPressed:
              (isFirst) ? null : pageManager!.onPreviousSongButtonPressed,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager!.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(20.0),
              // padding: const EdgeInsets.all(16),
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 28.0,
              color: primaryColor,
              onPressed: pageManager!.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              iconSize: 28.0,
              color: primaryColor,
              onPressed: pageManager!.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager!.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Icon(Icons.skip_next, color: primaryColor),
          onPressed: (isLast) ? null : pageManager!.onNextSongButtonPressed,
        );
      },
    );
  }
}
