abstract class HomeStates {}

class Initial extends HomeStates {}

class IsLoading extends HomeStates {}

class HomeError extends HomeStates {
  final String error;
  HomeError(this.error);
}

class TogglePassword extends HomeStates {}

class InitializeCurrentUser extends HomeStates {}

class GetLatestNews extends HomeStates {}

class GetScores extends HomeStates {}

class GetGeneralMatchesState extends HomeStates {
  final matches, todayMatches, yesterdayMatches, tomorrowMatches;
  GetGeneralMatchesState(
    this.matches,
    this.todayMatches,
    this.yesterdayMatches,
    this.tomorrowMatches,
  );
}

class GetSponsorsState extends HomeStates {
  final sponsors;
  GetSponsorsState(this.sponsors);
}
