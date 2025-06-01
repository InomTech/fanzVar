import 'dart:convert';

import 'package:fanzhashem/models/other_sports_model.dart';
import 'package:fanzhashem/models/playstation_player.dart';
import 'package:fanzhashem/modules/other_sports/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherSportsCubit extends Cubit<OtherSportsStates> {
  OtherSportsCubit() : super(Initial());

  static OtherSportsCubit get(context) => BlocProvider.of(context);
  OtherSports? otherSports;
  PlaystationPlayer? player;
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final filterFormKey = GlobalKey<FormState>();
  List sponsors = [];
  getOtherSports() {
    emit(LoadingData());
    rootBundle.loadString('assets/json/other_sports.json').then((value) {
      final data = json.decode(value);
      otherSports = OtherSports.fromJson(data);
      emit(DataLoaded());
    });
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

  getTeamSportsData(game) {
    if (game == 'Competition History') {
      game = 'Basketball';
    }
    emit(LoadingData());
    rootBundle.loadString('assets/json/$game.json').then((value) {
      final data = json.decode(value);
      player = PlaystationPlayer.fromJson(data);
      //  print(">>${playstationPlayer!.players![0].age}");
      emit(DataLoaded());
    });
  }

  getPlaystaionsPlayersData(game) {
    emit(LoadingData()); //playstation_players
    rootBundle.loadString('assets/json/$game.json').then((value) {
      final data = json.decode(value);
      player = PlaystationPlayer.fromJson(data);
      emit(DataLoaded());
    });
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
      if ((fromDateController.text.compareTo(toDateController.text) == -1) ||
          (fromDateController.text.compareTo(toDateController.text) == 0)) {
        print(fromDateController.text.compareTo(toDateController.text));

        emit(ApplyFilterSuccess());
      } else {
        showToast(msg: "From date must be before to date");

        emit(ApplyFilterError());
      }
    } else {
      showToast(msg: "All fields are required");

      emit(ApplyFilterError());
    }
  }
}
