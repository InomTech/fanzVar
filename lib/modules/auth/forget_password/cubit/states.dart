abstract class ForgetPasswordStates {}

class Initial extends ForgetPasswordStates {}

class IsLoading extends ForgetPasswordStates {}

class ForgetPasswordError extends ForgetPasswordStates {
  final String error;
  ForgetPasswordError(this.error);
}

class SendEmailSuccess extends ForgetPasswordStates {}