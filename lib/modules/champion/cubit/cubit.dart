
import 'dart:convert';

import 'package:fanzhashem/modules/champion/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/general_match_model.dart';

class ChampionCubit extends Cubit<ChampionStates> {
  ChampionCubit() : super(Initial());

  static ChampionCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool choose1 = false;
  bool choose2 = true;
  bool choose3 = false;

  List sponsors = [];

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
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

  getChampion() async {
    String data = await rootBundle.loadString('assets/json/champion.json');

    List jsonResult = json.decode(data)["Championships"];
    emit(GetChampionState(jsonResult));
  }

  /// ============================
  getChampionMatchesAndGroups(
      {required categoryID, required championID}) async {
    List championMatches = [];
    List championGroups = [];
    List championRanking = [];
    List championgoalsScorres = [];

    /// get champion_matches  from JSON FILE
    String matches =
        await rootBundle.loadString('assets/json/champion_matches.json');

    /// get champion_groups  from JSON FILE
    String groups =
        await rootBundle.loadString('assets/json/champion_groups.json');

    /// get champion_ranking  from JSON FILE
    String ranking =
        await rootBundle.loadString('assets/json/champion_ranking.json');

    ///get goals scoress
    String scoress =
        await rootBundle.loadString('assets/json/champion_scorres_goals.json');
    List jsonResult = json.decode(matches)["ChampionMatches"];
    for (var item in jsonResult) {
      if (item["CategoryID"] == categoryID &&
          item["ChampionID"] == championID) {
        championMatches.add(item);
      }
    }

    List jsonResult2 = json.decode(groups)["ChampionGroups"];
    for (var item in jsonResult2) {
      if (item["CategoryID"] == categoryID &&
          item["ChampionID"] == championID) {
        championGroups.add(item);
      }
    }
    List jsonResult3 = json.decode(ranking)["ChampionRanking"];
    for (var item in jsonResult3) {
      championRanking.add(item);
    }
    List jsonResult4 = json.decode(scoress)["ChampionGoalsScorres"];
    for (var item in jsonResult4) {
      if (item["CategoryID"] == categoryID &&
          item["ChampionID"] == championID) {
        championgoalsScorres.add(item['champion_goal_scorres']);
      }
    }

    emit(GetChampionMatchesAndGroupsState(championMatches, championGroups,
        championRanking, championgoalsScorres));
  }

  ///
  ///
  getGeneralMatches(isEnglish) async {
    String assetPath = isEnglish == true
        ? 'assets/json/general_matches.json'
        : 'assets/json/general_matches_ar.json';
    String data = await rootBundle.loadString(assetPath);
    List gallery = json.decode(data)["GeneralMatches"]["Gallery"];

    // var matches = jsonResult.map((e) => GeneralMatchModel.fromJson(e)).toList();
    // List<GeneralMatchModel> todayMatches = [];
    // List<GeneralMatchModel> yesterdayMatches = [];
    // List<GeneralMatchModel> tomorrowMatches = [];
    // for (var item in matches) {
    //   // if (item.date == "Tomorrow" || item.date == "غدا")
    //   //   tomorrowMatches.add(item);
    //   // if (item.date == "Today" || item.date == "اليوم") todayMatches.add(item);
    //   // if (item.date == "Yesterday" || item.date == "أمس")
    //   //   yesterdayMatches.add(item);
    // }

    emit(GetGeneralChampionState(gallery));
  }

  getCountryProfileData(id) async {
    String assetPath = 'assets/json/general_matches_for_country.json';
    String data = await rootBundle.loadString(assetPath);
    List jsonResult = json.decode(data)["GeneralMatches"];

    List<GeneralMatchModel> matches =
        jsonResult.map((e) => GeneralMatchModel.fromJson(e)).toList();
    try {
      var match = matches.firstWhere(
        (GeneralMatchModel e) => (e.matchId == id),
      );

      bool isFirstTeam;
      if (match.firstTeamId == id) {
        isFirstTeam = true;
      } else {
        isFirstTeam = false;
      }

      emit(GetCountryProfileDataState(isFirstTeam, matches));
    } catch (e) {
      print(e);
    }
    ///////////////////////////////////////////
  }
}
