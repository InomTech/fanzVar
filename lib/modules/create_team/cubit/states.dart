abstract class CreateTeamStates {}

class Initial extends CreateTeamStates {}

class IsLoading extends CreateTeamStates {}

class CreateTeamError extends CreateTeamStates {
  final String error;
  CreateTeamError(this.error);
}

class SelectPlayer extends CreateTeamStates {}

class SelectPlayerAgeRange extends CreateTeamStates {}

class SubmitSuccess extends CreateTeamStates {}

class SubmitError extends CreateTeamStates {}