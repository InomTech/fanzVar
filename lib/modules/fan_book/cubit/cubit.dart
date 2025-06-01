import 'dart:convert';

import 'package:fanzhashem/modules/fan_book/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FanBookCubit extends Cubit<FanBookStates> {
  FanBookCubit() : super(Initial());

  static FanBookCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  List songsList = [];
  List videosList = [];
  int songIndex = 0;
  songIndexFun(value) {
    songIndex = value;
    emit(SongsIndexState());
  }

  getVideosList() async {
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/fanbook_video.json');
    videosList = json.decode(data)['videos_list'];
    emit(VideosListLoadedSuccessfuly(videosList));
  }

  getSongsList() async {
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/fanbook_songs.json');
    songsList = json.decode(data)['songs_list'];
    emit(SongsListLoadedSuccessfuly(songsList));
  }

  getSongisList() async {
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/fanbook_songs.json');
    songsList = json.decode(data)['songs_list'];
    emit(SongsListLoadedSuccessfuly(songsList));
  }

  getAlbumsList() async {
    String data = await rootBundle.loadString('assets/json/album.json');
    videosList = json.decode(data);
    emit(AblumListLoadedSuccessfuly(videosList));
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
