import 'dart:convert';

import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/models/team_ranking_model.dart';
import 'package:fanzhashem/modules/ranking/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankingCubit extends Cubit<RankingStates> {
  RankingCubit() : super(Initial());

  static RankingCubit get(context) => BlocProvider.of(context);

  Map countryRegion = {};
  String dropDownCountry = '';
  String dropDownRegion = '';
  List countries = [];
  List regions = [];

  getCountryRegion() async {
    //  await Future.delayed(Duration(seconds: 2));
    String data =
        await rootBundle.loadString('assets/json/region_country.json');
    countryRegion = json.decode(data);
    startedData();
    print(regions);
    emit(GetCountiesDataState());
  }

  startedData() {
    dropDownCountry = countryRegion["all_countries"][0];
    dropDownRegion = countryRegion[dropDownCountry.toLowerCase()][0];
    print(dropDownRegion);
    countries = countryRegion["all_countries"];
    regions = countryRegion[dropDownCountry.toLowerCase()];
  }

  void changeDropDownRegion(value) {
    dropDownRegion = value!;
    emit(DropDownRegionChangeState());
  }

  void changeDropDownCountry(value) {
    regions = [];
    dropDownCountry = value!;
    regions = countryRegion[dropDownCountry.toLowerCase()];
    dropDownRegion = regions[0];
    emit(DropDownCountryChangeState());
  }

  getRankingList() async {
    String data =
        await rootBundle.loadString('assets/json/national_ranking.json');
    String data2 =
        await rootBundle.loadString('assets/json/local_ranking.json');
    List jsonResult = json.decode(data)["national_ranking"];
    List jsonResult2 = json.decode(data2)["local_ranking"];

    List<TeamRankingModel> nationalRankingList =
        jsonResult.map((e) => TeamRankingModel.fromJson(e)).toList();
    List<TeamRankingModel> localRankingList =
        jsonResult2.map((e) => TeamRankingModel.fromJson(e)).toList();

    emit(GetRankingListState(nationalRankingList, localRankingList));
  }

  getClubProfileData(id) async {
    String assetPath = 'assets/json/general_matches.json';
    String data = await rootBundle.loadString(assetPath);
    List jsonResult = json.decode(data)["GeneralMatches"];

    List<GeneralMatchModel> matches =
        jsonResult.map((e) => GeneralMatchModel.fromJson(e)).toList();
    try {
      var match = matches.firstWhere(
        (GeneralMatchModel e) => (e.firstTeamId == id || e.secondTeamId == id),
      );

      bool isFirstTeam;
      if (match.firstTeamId == id) {
        isFirstTeam = true;
      } else {
        isFirstTeam = false;
      }

      emit(GetClubProfileDataState(isFirstTeam, match));
    } catch (e) {
      print(e);
    }
    ///////////////////////////////////////////
  }

  sortListByTotal(List<TeamRankingModel> nationalList,
      List<TeamRankingModel> localList, String sorting) {
    if (sorting == "up") {
      nationalList.sort((a, b) => a.profit.compareTo(b.profit));
      localList.sort((a, b) => a.profit.compareTo(b.profit));
    }
    if (sorting == "down") {
      nationalList.sort((a, b) => b.profit.compareTo(a.profit));
      localList.sort((a, b) => b.profit.compareTo(a.profit));
    }
    emit(GetRankingListState(nationalList, localList));
  }

  sortListByFans(List<TeamRankingModel> nationalList,
      List<TeamRankingModel> localList, String sorting) {
    if (sorting == "up") {
      localList.sort((a, b) => a.fans.compareTo(b.fans));
      nationalList.sort((a, b) => a.fans.compareTo(b.fans));
    }
    if (sorting == "down") {
      localList.sort((a, b) => b.fans.compareTo(a.fans));
      nationalList.sort((a, b) => b.fans.compareTo(a.fans));
    }
    emit(GetRankingListState(nationalList, localList));
  }
}
