abstract class FansProfileStates {}

class Initial extends FansProfileStates {}

class IsLoading extends FansProfileStates {}

class FanBookError extends FansProfileStates {
  final String error;
  FanBookError(this.error);
}

class TogglePassword extends FansProfileStates {}

class DataLoaded extends FansProfileStates {}

class InitializeCurrentUser extends FansProfileStates {}
