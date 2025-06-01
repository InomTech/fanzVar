abstract class ElectionStates {}

class Initial extends ElectionStates {}

class GetFansElectionState extends ElectionStates {
  final fansElectionList;
  GetFansElectionState(this.fansElectionList);
}
