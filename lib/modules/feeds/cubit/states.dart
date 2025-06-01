abstract class FeedsStates {}

class Initial extends FeedsStates {}

class IsLoading extends FeedsStates {}

class FanBookError extends FeedsStates {
  final String error;
  FanBookError(this.error);
}

class TogglePassword extends FeedsStates {}

class DataLoaded extends FeedsStates {}

class InitializeCurrentUser extends FeedsStates {}
