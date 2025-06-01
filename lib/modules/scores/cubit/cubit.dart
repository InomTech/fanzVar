import 'dart:convert';

import 'package:fanzhashem/models/clubs_model.dart';
import 'package:fanzhashem/modules/club/club_profile.dart';
import 'package:fanzhashem/modules/scores/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoresCubit extends Cubit<ScoresStates> {
  ScoresCubit() : super(Initial());

  static ScoresCubit get(context) => BlocProvider.of(context);

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final filterFormKey = GlobalKey<FormState>();
  String? selectedPlayer;
  bool selectedPlayerError = false;
  List<String> Champions = [
    "FIFA World Cup",
    "CAF Champions League",
    "FIFA Club World Cup",
    "FIFA U-20 World Cup",
    "Cup 4"
  ];
  String? selectedValueChampoinLeague;
  bool isLoading = false;
  selectValueChampoinLeague(String player) {
    selectedValueChampoinLeague = player;
    emit(SelectValueChampoinLeague());
  }

  getChampion() async {
    String data = await rootBundle.loadString('assets/json/champion.json');

    List jsonResult = json.decode(data)["Championships"];
    emit(GetScoresState(jsonResult));
  }

  addDate(datePick, {bool isFrom = true}) {
    if (datePick != null) {
      String date = "${datePick.day} / ${datePick.month} / ${datePick.year}";

      print(date);
      if (isFrom) {
        fromDateController.text = date;
      } else {
        toDateController.text = date;
      }
    }

    emit(AddDate());
  }

  applyFilter() {
    if (filterFormKey.currentState!.validate()) {
      print(fromDateController.text.compareTo(toDateController.text));
      print(fromDateController.text.compareTo(toDateController.text));
      if ((fromDateController.text.compareTo(toDateController.text) < 0) ||
          (fromDateController.text.compareTo(toDateController.text) == 0)) {
        print(fromDateController.text.compareTo(toDateController.text));

        emit(ApplyFilterSuccess());
      } else {
        print(fromDateController.text.compareTo(toDateController.text));

        // showToast(msg: "From date must be before to date");

        emit(ApplyFilterError());
      }
    } else {
      showToast(msg: "All fields are required");

      emit(ApplyFilterError());
    }
  }

  navigateToClub(String clubName, context) async {
    String data = await rootBundle.loadString('assets/json/clubs.json');
    //print(data);
    List jsonResult = json.decode(data)["Clubs"];

    List<ClubsModel> clubs =
        jsonResult.map((e) => ClubsModel.fromJson(e)).toList();

    print("clubName ====> $clubName");

    ClubsModel selectedClub = ClubsModel();

    for (var club in clubs) {
      if (club.name == clubName) {
        selectedClub = club;
        break;
      }
    }

    print("selectedClubName ====> ${selectedClub.name} ${selectedClub.image}");

    navigateTo(
        context,
        ClubProfile(
            club: selectedClub, clubLocation: selectedClub.address ?? ""));
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
