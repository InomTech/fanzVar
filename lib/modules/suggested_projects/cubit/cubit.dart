import 'dart:convert';

import 'package:fanzhashem/modules/suggested_projects/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedProjectsCubit extends Cubit<SuggestedProjectsStates> {
  SuggestedProjectsCubit() : super(Initial());

  static SuggestedProjectsCubit get(context) => BlocProvider.of(context);

  /// ======================= getProjectsFun  =========================
  getProjectsFun() async {
    String data =
        await rootBundle.loadString('assets/json/suggested_projects.json');
    List jsonResult = json.decode(data)["suggested_projects"];

    emit(GetSuggestedProjectsState(jsonResult));
  }

  bool isFavourt = true;


  void FavourtFillColor(){

    isFavourt =! isFavourt;
    emit(FavourtState());
  }
 bool isVoted = true;


  void Voted(){

    isVoted =! isVoted;
    emit(VotedState());
  }
}
