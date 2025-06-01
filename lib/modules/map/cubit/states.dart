abstract class MapStates {}

class Initial extends MapStates {}

class IsLoading extends MapStates {}

class MapError extends MapStates {
  final String error;
  MapError(this.error);
}

class DeterminePermission extends MapStates {}

class GetLatLng extends MapStates {
  final double latitude, longitude;

  GetLatLng(this.latitude, this.longitude);
}

class InitialCameraPosition extends MapStates {}

class GetCurrentLatLng extends MapStates {
  final double latitude, longitude;

  GetCurrentLatLng(this.latitude, this.longitude);
}

class GetCountries extends MapStates {}

class SelectCountry extends MapStates {}

class GetAddressFromLatLng extends MapStates {
  final String country;

  GetAddressFromLatLng(this.country);
}

class GetClubs extends MapStates {}

class EmptyMarkers extends MapStates {}

class FillMarkers extends MapStates {}

class ShowClubDetailsBottomSheet extends MapStates {
  final clubDetails;
  ShowClubDetailsBottomSheet(this.clubDetails);
}
