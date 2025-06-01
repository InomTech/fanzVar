abstract class PlayStationPlayersStates {}

class Initial extends PlayStationPlayersStates {}

class IsLoading extends PlayStationPlayersStates {}

class PlayStationPlayersError extends PlayStationPlayersStates {
  final String error;
  PlayStationPlayersError(this.error);
}

class GetSponsorsState extends PlayStationPlayersStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}

class AddDate extends PlayStationPlayersStates {}

class ApplyFilterSuccess extends PlayStationPlayersStates {}

class ApplyFilterError extends PlayStationPlayersStates {}

class LoadingData extends PlayStationPlayersStates {}

class DataLoaded extends PlayStationPlayersStates {}
