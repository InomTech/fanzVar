abstract class StoresStates {}

class Initial extends StoresStates {}

class IsLoading extends StoresStates {}

class StoresError extends StoresStates {
  final String error;
  StoresError(this.error);
}

class GetStores extends StoresStates {}