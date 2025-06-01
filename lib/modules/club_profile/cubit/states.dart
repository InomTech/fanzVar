import 'package:fanzhashem/models/coach_profile/coach_profile_model.dart';

abstract class ClubProfileStates {}

class Initial extends ClubProfileStates {}

class GetSponsorsState extends ClubProfileStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}

class GetCoachProfileState extends ClubProfileStates {
  final CoachProfileModel coachProfile;
  GetCoachProfileState(this.coachProfile);
}
