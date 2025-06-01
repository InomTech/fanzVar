import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// استخدام اسم مستعار لمنع التضارب
import 'package:fanzhashem/modules/player_profile/cubit/states.dart' as profile_states;

class PlayerProfileCubit extends Cubit<profile_states.PlayerProfileStates> {
  PlayerProfileCubit() : super(profile_states.PlayerProfileInitial());

  static PlayerProfileCubit get(context) => BlocProvider.of(context);

  getPlayerProfileInfo(playerID) async {
    String data = await rootBundle.loadString('assets/json/player_profile.json');
    List jsonResult = json.decode(data)["player_profile"];

    var playerProfile = jsonResult.firstWhere(
          (e) => e["player_id"] == playerID,
      orElse: () => null,
    );

    emit(profile_states.GetPlayerProfileState(playerProfile));
  }

  List<String> Years = [
    "2010-2011",
    "2011-2012",
    "2012-2013",
    "2013-2014",
    "2014-2015",
    "2016-2017",
    "2017-2018",
    "2018-2019",
    "2019-2020",
    "2020-2021",
    "2021-2022",
  ];

  String? selectedYear;

  selectValueYear(String year) {
    selectedYear = year;
    emit(profile_states.SelectValueCYear());
  }
}
