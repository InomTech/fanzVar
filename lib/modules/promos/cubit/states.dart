abstract class PromosStates {}

class Initial extends PromosStates {}

class IsLoading extends PromosStates {}

class PromosError extends PromosStates {
  final String error;
  PromosError(this.error);
}

class GetPromos extends PromosStates {}
