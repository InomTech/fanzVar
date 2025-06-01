// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:fanzhashem/modules/create_competition/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateCompetitionCubit extends Cubit<CreateCompetitionStates> {
  CreateCompetitionCubit() : super(Initial());

  static CreateCompetitionCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final durationController = TextEditingController();
  //final courtAddressController = TextEditingController(); //location ctrl
  final dueTimeController = TextEditingController();
  final startDateController = TextEditingController();

  final firstFormKey = GlobalKey<FormState>();

  final secondFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool selectStateError = false;

  String countryValue = "🇪🇬    Egypt";

  String? cityValue, stateValue;

  String? selectedPlayer;

  List<String> players = ["Mo Salah", "Messy", "Abu Treka"];

  String? selectedPlayerAgeRange;

  List<String> playerAgeRanges = ["12-20", "20-25", "25-30"];

  bool selectedPlayerAgeRangeError = false;

  bool selectedPlayerError = false;

  String? selectedCompetitionsType;
  bool competitionsTypeError = false;
  List<String> competitionsTypes = ["PS", "Single", "Fifa", "Multi"];

  String? selectedHaveCamera;
  bool haveCameraError = false;
  List<String> haveCamera = ["Yes", "No"];

  String? selectedHaveReferee;
  bool haveRefereeError = false;
  List<String> haveReferee = ["Yes", "No"];

  Position? position;
  bool permissionAllowed = false;
  String addressTxt = "empty";
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(30, 31),
    zoom: 14,
  );
  bool pickLoctionzflag = false;

  selectOption(value,
      {bool isCompetitionType = false,
      bool isHaveCamera = false,
      bool isHaveReferee = false}) {
    if (isCompetitionType) {
      selectedCompetitionsType = value;
    } else if (isHaveCamera) {
      selectedHaveCamera = value;
    } else if (isHaveReferee) {
      selectedHaveReferee = value;
    }

    emit(SelectOption());
  }

  addStartDate(datePick) {
    if (datePick != null) {
      startDateController.text =
          "${datePick.day} / ${datePick.month} / ${datePick.year}";

      print(startDateController.text);
    }

    emit(AddStartDate());
  }

  selectPlayer(String player) {
    selectedPlayer = player;
    emit(SelectPlayer());
  }

  selectPlayerAgeRange(String playerAgeRange) {
    selectedPlayerAgeRange = playerAgeRange;
    emit(SelectPlayerAgeRange());
  }

  selectState(value,
      {bool isCountry = false, bool isCity = false, bool isState = false}) {
    if (isCountry) {
      countryValue = value;
    } else if (isCity) {
      cityValue = value;
    } else {
      stateValue = value;
    }

    emit(Select());
  }

  next() {
    if (stateValue == "Choose State") {
      stateValue = null;
    }
    if (countryValue == "Choose Country") {
      countryValue = "Choose Country";
    }
    if (cityValue == "Choose City") {
      cityValue = null;
    }

    if (firstFormKey.currentState!.validate() &&
        countryValue != "Choose Country" &&
        cityValue != null &&
        stateValue != null) {
      toggleIsLoading();
      print("stateValue $stateValue");

      selectStateError = false;

      emit(SubmitSuccess());

      toggleIsLoading();
    } else {
      if (cityValue == null || stateValue == null) {
        selectStateError = true;
      } else {
        selectStateError = false;
      }

      print("stateValue $stateValue");

      showToast(msg: "All fields are required");

      emit(SubmitError());
    }
  }

  submit() {
    if (secondFormKey.currentState!.validate() &&
        selectedPlayerAgeRange != null &&
        selectedPlayer != null &&
        selectedHaveReferee != null &&
        selectedHaveCamera != null &&
        selectedCompetitionsType != null) {
      toggleIsLoading();

      selectedPlayerAgeRangeError = false;
      selectedPlayerError = false;
      competitionsTypeError = false;
      haveRefereeError = false;
      haveCameraError = false;

      emit(SubmitSuccess());

      toggleIsLoading();
    } else {
      if (selectedPlayerAgeRange.toString().isEmpty ||
          selectedPlayerAgeRange == null) {
        selectedPlayerAgeRangeError = true;
      } else {
        selectedPlayerAgeRangeError = false;
      }

      if (selectedPlayer.toString().isEmpty || selectedPlayer == null) {
        selectedPlayerError = true;
      } else {
        selectedPlayerError = false;
      }

      if (selectedCompetitionsType == null) {
        competitionsTypeError = true;
      } else {
        competitionsTypeError = false;
      }

      if (selectedHaveCamera == null) {
        haveCameraError = true;
      } else {
        haveCameraError = false;
      }

      if (selectedHaveReferee == null) {
        haveRefereeError = true;
      } else {
        haveRefereeError = false;
      }

      showToast(msg: "All fields are required");

      emit(SubmitError());
    }
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }

  //get current location when open the screen
  getCurrentPosition() async {
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (position != null) {
        // إعداد موقع الكاميرا على الخريطة
        cameraPosition = CameraPosition(
          target: LatLng(position!.latitude, position!.longitude),
          zoom: 14,
        );

        // استخدام geocoding للحصول على العنوان
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude,
          position!.longitude,
        );

        Placemark place = placemarks.first;
        addressTxt = "${place.street}, ${place.locality}, ${place.country}";
        permissionAllowed = true;
        emit(InitialLocationAddress());
      } else {
        throw Exception("Position is null");
      }
    } catch (e) {
      log("getCurrentPosition error: $e");
      addressTxt = "Location Permission is Denied";
      permissionAllowed = false;
      emit(DeterminePermission());
    }
  }

  changePickLoctionzflag() {
    pickLoctionzflag = true;
    emit(GetInitialCameraPosition());
  }

  //update address text
  changeAddress(String addresssText) {
    addressTxt = addresssText;
    emit(GetInitialCameraPosition());
  }
}
