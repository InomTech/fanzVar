import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';

class PageManager {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final currentSongNotifier = ValueNotifier<Map<dynamic, dynamic>>({});

  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);
  final List songsList;
  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  PageManager({required this.songsList}) {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
  }

  void _setInitialPlaylist() async {
    final playList = songsList.map((e) {
      return AudioSource.uri(Uri.parse(e['video_linke']), tag: e['id']);
    }).toList();
    _playlist = ConcatenatingAudioSource(children: playList);
    await _audioPlayer.setAudioSource(_playlist);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      // if (sequenceState == null) return;

      // update current song title
      final currentItem = sequenceState.currentSource;
      final id = currentItem?.tag as int;
      final index = songsList.indexWhere((element) => element['id'] == id);
      currentSongTitleNotifier.value = songsList[index]['title'] ?? '';
      currentSongNotifier.value = songsList[index];
      // update playlist
      final playlist = sequenceState.effectiveSequence;
      final titles = songsList.map((item) => item['title'] as String).toList();
      playlistNotifier.value = titles;

      // update shuffle mode
      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;

      // update previous and next buttons
      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem;
        isLastSongNotifier.value = playlist.last == currentItem;
      }
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        _audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        _audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  void onPreviousSongButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
  }

  void onShuffleButtonPressed() async {
    final enable = !_audioPlayer.shuffleModeEnabled;
    if (enable) {
      await _audioPlayer.shuffle();
    }
    await _audioPlayer.setShuffleModeEnabled(enable);
  }

  void addSong() {
    final songNumber = _playlist.length + 1;
    const prefix = 'https://www.soundhelix.com/examples/mp3';
    final song = Uri.parse('$prefix/SoundHelix-Song-$songNumber.mp3');
    _playlist.add(AudioSource.uri(song, tag: 'Song $songNumber'));
  }

  void removeSong() {
    final index = _playlist.length - 1;
    if (index < 0) return;
    _playlist.removeAt(index);
  }
}
