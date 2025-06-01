import 'dart:convert';

import 'package:fanzhashem/models/football_competitions.dart';
import 'package:fanzhashem/modules/competitions/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompetitionsCubit extends Cubit<CompetitionsStates> {
  CompetitionsCubit() : super(Initial());


  static CompetitionsCubit get(context) => BlocProvider.of(context);

  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final filterFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  FootballCompetitions? footballCompetitions;
  List sponsors = [];

  getCompetitionsData(isEnglish) async {
    emit(LoadingData());
    print(isEnglish);
    // bool isEn = context.locale == Locale('en') ? true : false;
    String assetPath = isEnglish == true
        ? 'assets/json/football.json'
        : 'assets/json/football_ar.json';
    rootBundle.loadString(assetPath).then((value) {
      final data = json.decode(value);
      footballCompetitions = FootballCompetitions.fromJson(data["football"]);
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
