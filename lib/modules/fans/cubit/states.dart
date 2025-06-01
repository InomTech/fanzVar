abstract class FansStates {}

class Initial extends FansStates {}

class IsLoading extends FansStates {}

class FollowingState extends FansStates {}

class FanBookError extends FansStates {
  final String error;
  FanBookError(this.error);
}

class TogglePassword extends FansStates {}

class DataLoaded extends FansStates {}

class InitializeCurrentUser extends FansStates {}
