import 'package:fanzhashem/modules/coach_profile/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CoachProfileCubit extends Cubit<CoachProfileStates> {
  CoachProfileCubit() : super(InitialState());

  static CoachProfileCubit get(context) => BlocProvider.of(context);

  // getCoachProfileInfo(playerID) async {
  //   String data = await rootBundle.loadString('assets/json/coach_profile.json');
  //   List jsonResult = json.decode(data)["coach_profile"];
  //   List coachesList =
  //       jsonResult.map((e) => CoachProfileModel.fromJson(e)).toList();

  //   // var coachProfile = jsonResult.firstWhere(
  //   //   (e) => e["coach_id"] == playerID,
  //   //   orElse: () => null,
  //   // );
  //   CoachProfileModel coachProfile = coachesList.firstWhere(
  //     (e) => e.coachId == playerID,
  //     orElse: () => null,
  //   );

  //   emit(GetCoachProfileState(coachProfile));
  // }
}
