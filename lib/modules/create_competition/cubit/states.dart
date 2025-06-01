abstract class CreateCompetitionStates {}

class Initial extends CreateCompetitionStates {}

class IsLoading extends CreateCompetitionStates {}

class CreateCompetitionError extends CreateCompetitionStates {
  final String error;
  CreateCompetitionError(this.error);
}

class SelectPlayer extends CreateCompetitionStates {}

class SelectPlayerAgeRange extends CreateCompetitionStates {}

class SubmitSuccess extends CreateCompetitionStates {}

class SubmitError extends CreateCompetitionStates {}

class Select extends CreateCompetitionStates {}

class AddStartDate extends CreateCompetitionStates {}

class SelectOption extends CreateCompetitionStates {}

class InitialPosition extends CreateCompetitionStates {}

class InitialLocationAddress extends CreateCompetitionStates {}

class GetInitialCameraPosition extends CreateCompetitionStates {}

class DeterminePermission extends CreateCompetitionStates {}
