// ElectionCubit

import 'dart:convert';

import 'package:fanzhashem/models/fan_election_model.dart';
import 'package:fanzhashem/modules/fans_election/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectionCubit extends Cubit<ElectionStates> {
  ElectionCubit() : super(Initial());

  static ElectionCubit get(context) => BlocProvider.of(context);
  getFansElectionInfo() async {
    String data = await rootBundle.loadString('assets/json/fans_election.json');
    List jsonResult = json.decode(data)["fans_election"];
    List fans = jsonResult.map((e) => FanElectionModel.fromJson(e)).toList();

    emit(GetFansElectionState(fans));
  }
}
