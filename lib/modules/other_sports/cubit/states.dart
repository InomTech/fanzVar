abstract class OtherSportsStates {}

class Initial extends OtherSportsStates {}

class IsLoading extends OtherSportsStates {}

class OtherSportsError extends OtherSportsStates {
  final String error;
  OtherSportsError(this.error);
}

class GetSponsorsState extends OtherSportsStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}

class GetOtherSports extends OtherSportsStates {}

class ApplyFilterSuccess extends OtherSportsStates {}

class LoadingData extends OtherSportsStates {}

class DataLoaded extends OtherSportsStates {}

class AddDate extends OtherSportsStates {}

class ApplyFilterError extends OtherSportsStates {}
