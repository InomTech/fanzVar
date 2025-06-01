import '../../../models/general_match_model.dart';

abstract class ChampionStates {}

class Initial extends ChampionStates {}

class IsLoading extends ChampionStates {}

class GetGeneralChampionState extends ChampionStates {
  final gallery;
  GetGeneralChampionState(this.gallery);
}

class ChampionError extends ChampionStates {
  final String error;
  ChampionError(this.error);
}

class TogglePassword extends ChampionStates {}

class InitializeCurrentUser extends ChampionStates {}

class GetChampionState extends ChampionStates {
  final championList;
  GetChampionState(this.championList);
}

class GetSponsorsState extends ChampionStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}

class GetChampionMatchesAndGroupsState extends ChampionStates {
  final championMatches, championGroups, championRanking, championgoalsScorres;

  GetChampionMatchesAndGroupsState(this.championMatches, this.championGroups,
      this.championRanking, this.championgoalsScorres);
}

class GetCountryProfileDataState extends ChampionStates {
  final bool isFirstTeam;
  final List<GeneralMatchModel> info;
  GetCountryProfileDataState(this.isFirstTeam, this.info);
}
