import 'dart:convert';

import 'package:fanzhashem/models/playstation_player.dart';
import 'package:fanzhashem/modules/playstation/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayStationPlayersCubit extends Cubit<PlayStationPlayersStates> {
  PlayStationPlayersCubit() : super(Initial());

  static PlayStationPlayersCubit get(context) => BlocProvider.of(context);

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final filterFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  PlaystationPlayer? playstationPlayer;
  List sponsors = [];

  getPlaystaionsPlayersData() {
    emit(LoadingData());
    rootBundle.loadString('assets/json/playstation_players.json').then((value) {
      final data = json.decode(value);
      playstationPlayer = PlaystationPlayer.fromJson(data);
      //  print(">>${playstationPlayer!.players![0].age}");
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

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
