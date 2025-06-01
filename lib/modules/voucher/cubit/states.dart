abstract class VoucherStates {}

class Initial extends VoucherStates {}

class IsLoading extends VoucherStates {}

class VoucherError extends VoucherStates {
  final String error;
  VoucherError(this.error);
}

class TogglePassword extends VoucherStates {}

class InitializeCurrentUser extends VoucherStates {}

class UpdateSecondsValueState extends VoucherStates {
  final seconds;
  UpdateSecondsValueState(this.seconds);
}

class CancelSecondsTimerState extends VoucherStates {}
