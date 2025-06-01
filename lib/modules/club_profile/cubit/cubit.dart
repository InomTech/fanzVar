import 'dart:convert';

import 'package:fanzhashem/models/coach_profile/coach_profile_model.dart';
import 'package:fanzhashem/modules/club_profile/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubProfileCubit extends Cubit<ClubProfileStates> {
  ClubProfileCubit() : super(Initial());

  static ClubProfileCubit get(context) => BlocProvider.of(context);
  List sponsors = [];
  getCoachProfileInfo(playerID) async {
    String data = await rootBundle.loadString('assets/json/coach_profile.json');
    List jsonResult = json.decode(data)["coach_profile"];
    List coachesList =
        jsonResult.map((e) => CoachProfileModel.fromJson(e)).toList();

    CoachProfileModel coachProfile = coachesList.firstWhere(
      (e) => e.coachId == playerID,
      orElse: () => null,
    );

    emit(GetCoachProfileState(coachProfile));
  }

  getSponsors(value) async {
    String data = await rootBundle.loadString('assets/json/sponsor.json');
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
}
