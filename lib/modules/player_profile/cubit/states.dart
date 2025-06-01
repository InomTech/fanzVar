abstract class PlayerProfileStates {}

class PlayerProfileInitial extends PlayerProfileStates {}

class GetPlayerProfileState extends PlayerProfileStates {
  final dynamic profile;
  GetPlayerProfileState(this.profile);
}

class SelectValueCYear extends PlayerProfileStates {}
