abstract class SideDrawerStates {}

class Initial extends SideDrawerStates {}

class IsLoading extends SideDrawerStates {}

class GetLatestNewsForClub extends SideDrawerStates {
  final latestNews;

  GetLatestNewsForClub(this.latestNews);
}

class SideDrawerError extends SideDrawerStates {
  final String error;
  SideDrawerError(this.error);
}

class LogoutSuccess extends SideDrawerStates {}

class GetAppVersion extends SideDrawerStates {
  final String version;
  final String buildNumber;

  GetAppVersion(this.version, this.buildNumber);
}
