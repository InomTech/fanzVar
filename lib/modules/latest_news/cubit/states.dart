abstract class LatestNewsStates {}

class Initial extends LatestNewsStates {}

class IsLoading extends LatestNewsStates {}

class LatestNewsError extends LatestNewsStates {
  final String error;
  LatestNewsError(this.error);
}

class TogglePassword extends LatestNewsStates {}

class InitializeCurrentUser extends LatestNewsStates {}