abstract class CompetitionsStates {}

class Initial extends CompetitionsStates {}

class LoadingData extends CompetitionsStates {}

class DataLoaded extends CompetitionsStates {}

class IsLoading extends CompetitionsStates {}

class CompetitionsError extends CompetitionsStates {
  final String error;
  CompetitionsError(this.error);
}

class GetSponsorsState extends CompetitionsStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}

class AddDate extends CompetitionsStates {}

class ApplyFilterSuccess extends CompetitionsStates {}

class ApplyFilterError extends CompetitionsStates {}
