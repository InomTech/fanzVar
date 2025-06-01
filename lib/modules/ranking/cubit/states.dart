import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/models/team_ranking_model.dart';

abstract class RankingStates {}

class Initial extends RankingStates {}

class GetRankingListState extends RankingStates {
  final List<TeamRankingModel> nationalRankingList, localRankingList;
  GetRankingListState(this.nationalRankingList, this.localRankingList);
}

class DropDownRegionChangeState extends RankingStates{}

class DropDownCountryChangeState extends RankingStates{}

class GetCountiesDataState extends RankingStates{
  
}

class GetClubProfileDataState extends RankingStates {
  final bool isFirstTeam;
  final GeneralMatchModel info;
  GetClubProfileDataState(this.isFirstTeam, this.info);
}
