import 'package:fanzhashem/models/clubs_model.dart';

abstract class ScoresStates {}

class Initial extends ScoresStates {}

class IsLoading extends ScoresStates {}

class AddDate extends ScoresStates {}

class ApplyFilterSuccess extends ScoresStates {}

class ApplyFilterError extends ScoresStates {}

class GetScoresState extends ScoresStates {
  final championList;
  GetScoresState(this.championList);
}

class SelectValueChampoinLeague extends ScoresStates {}

class ScoresError extends ScoresStates {
  final String error;
  ScoresError(this.error);
}

class TogglePassword extends ScoresStates {}

class GetClub extends ScoresStates {
  final ClubsModel selectedClub;

  GetClub(this.selectedClub);
}
