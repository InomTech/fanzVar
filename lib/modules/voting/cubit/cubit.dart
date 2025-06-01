import 'dart:convert';

import 'package:fanzhashem/modules/voting/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VotingCubit extends Cubit<VotingScreenStates> {
  VotingCubit() : super(Initial());

  static VotingCubit get(context) => BlocProvider.of(context);

  // List coachesList = [];
  // List journalistsList =[];
  // List playerList =[];
  List list = [];
  List rowOfList = ['Players', 'Coaches', 'Clubs', 'journalists'];
  int indexlist = 0;
  indexchange(index) {
    indexlist = index;
    emit(IndexSuccessState());
  }

  getClubsFun() async {
    emit(LoadingState());
    list = [];
    String data = await rootBundle.loadString('assets/json/votingPlayers.json');
    list = json.decode(data)['clubs'];
    emit(GetPlayersListSuccessState());
  }

  getPlayersFun() async {
    emit(LoadingState());
    list = [];
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/votingPlayers.json');
    list = json.decode(data)['Player'];
    emit(GetPlayersListSuccessState());
  }

  getCoachesListFun() async {
    emit(LoadingState());
    list = [];
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/votingPlayers.json');
    list = json.decode(data)['Coaches'];
    emit(GetCoachesListSuccessState());
  }

  getjournalistsFun() async {
    emit(LoadingState());
    list = [];
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/votingPlayers.json');
    list = json.decode(data)['journalists'];
    emit(GetVotingListSuccessState());
  }
}
