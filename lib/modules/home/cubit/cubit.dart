import 'dart:convert';

import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/models/latest_news_model.dart';
import 'package:fanzhashem/models/scores_model.dart';
import 'package:fanzhashem/models/user_model.dart';
import 'package:fanzhashem/modules/home/cubit/states.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(Initial());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<LatestNewsModel> latestNews = [];

  List<ScoresModel> scores = [];
  List sponsors = [];

  initializeCurrentUser() async {
    print("initialize Current User");

    var currentUserDoc = getCurrentUser();



    emit(InitializeCurrentUser());
  }

  getLatestNews() async {
    String data = await rootBundle.loadString('assets/json/news.json');
    //print(data);
    List jsonResult = json.decode(data)["Latest News"];

    latestNews = jsonResult.map((e) => LatestNewsModel.fromJson(e)).toList();

    print("latestNews[0].url ====> ${latestNews[0].url}");

    emit(GetLatestNews());
  }

  getSponsors(value) async {
    String data = await rootBundle.loadString('assets/json/sponsor.json');
    //print(data);
    List jsonResult = json.decode(data)["Sponsor"];

    List sponsor = [];
    sponsors = jsonResult.toList();
    for (var item in sponsors) {
      if (item['sponsor'] == value) {
        sponsor.add(item['sponsor_list']);
      }
    }

    print("sponsor ====> $sponsor");

    emit(GetSponsorsState(sponsor));
  }

  getScores() async {
    String data = await rootBundle.loadString('assets/json/scores.json');
    print(data);
    List jsonResult = json.decode(data)["Scores"];

    scores = jsonResult.map((e) => ScoresModel.fromJson(e)).toList();

    print("scores[0].club1Name ====> ${scores[0].club1Image}");

    emit(GetScores());
  }

  getGeneralMatches(isEnglish) async {
    String assetPath = isEnglish == true
        ? 'assets/json/general_matches.json'
        : 'assets/json/general_matches.json';
    String data = await rootBundle.loadString(assetPath);
    List jsonResult = json.decode(data)["GeneralMatches"];

    var matches = jsonResult.map((e) => GeneralMatchModel.fromJson(e)).toList();
    List<GeneralMatchModel> todayMatches = [];
    List<GeneralMatchModel> yesterdayMatches = [];
    List<GeneralMatchModel> tomorrowMatches = [];
    for (var item in matches) {
      if (item.date == "Tomorrow" || item.date == "غدا") {
        tomorrowMatches.add(item);
      }
      if (item.date == "Today" || item.date == "اليوم") todayMatches.add(item);
      if (item.date == "Yesterday" || item.date == "أمس") {
        yesterdayMatches.add(item);
      }
    }

    emit(GetGeneralMatchesState(
        matches, todayMatches, yesterdayMatches, tomorrowMatches));
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
