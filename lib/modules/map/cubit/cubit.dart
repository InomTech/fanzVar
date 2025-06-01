import 'dart:convert';
import 'dart:ui' as ui;

import 'package:fanzhashem/models/clubs_model.dart';
import 'package:fanzhashem/models/country.dart';
import 'package:fanzhashem/modules/map/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/infoDialog.dart';
// import 'package:location/location.dart' as loc;
// import 'package:location/location.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(Initial());

  static MapCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  bool permissionAllowed = false;

  late CameraPosition cameraPosition;

  double? latitude;
  double? longitude;

  List<CountryModel> countries = [];

  List<ClubsModel> clubs = [];

  List<String> countriesStr = [];

  CountryModel? selectedCountry;

  Set<Marker> markers = {};
  BitmapDescriptor? mapMarker;

  getCountries() async {
    String data = await rootBundle.loadString('assets/json/country_codes.json');
    List jsonResult = json.decode(data)["ref_country_codes"];

    countries = jsonResult.map((e) => CountryModel.fromJson(e)).toList();

    for (var country in countries) {
      countriesStr.add(country.country ?? "");
    }

    print(countries[0].country);

    emit(GetCountries());
  }

  selectCountry(value) {
    for (var country in countries) {
      if (country.country == value) {
        selectedCountry = country;
        break;
      }
    }

    emit(SelectCountry());
  }

  getInitialCameraPosition() async {
    toggleIsLoading();
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.best,
      );

      cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14,
      );
      permissionAllowed = true;
      emit(InitialCameraPosition());
    } catch (e) {
      print("permissionAllowed $e");
      permissionAllowed = false;
      emit(DeterminePermission());
    }
    toggleIsLoading();
  }

  getLatLng(latitude, longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
    print("GetLatLng");
    emit(GetLatLng(latitude, longitude));
  }

  getCurrentLatLng() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("GetLatLng");
    emit(GetCurrentLatLng(position.latitude, position.longitude));
  }

  getAddressFromLatLng(double latitude, double longitude) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    // this is all you need
    Placemark placeMark = newPlace[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;

    print(country);

    emit(GetAddressFromLatLng(country!));
  }

  getClubs(context) async {
    clubs.clear();

    String data = await rootBundle.loadString('assets/json/clubs.json');
    //print(data);
    List jsonResult = json.decode(data)["Clubs"];

    clubs = jsonResult.map((e) => ClubsModel.fromJson(e)).toList();
    addMarkers(clubs, context);
    emit(GetClubs());
  }

  addMarkers(List clubs, context) async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/pin.png', 100);
    mapMarker = BitmapDescriptor.fromBytes(markerIcon);
    markers = {};
    emit(EmptyMarkers());
    for (int i = 0; i < clubs.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId("id=${i + 1}}"),
          position: LatLng(
            clubs[i].lat,
            clubs[i].lng,
          ),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: clubs[i].name,
            snippet: "${clubs[i].numOfFans} fans",
            onTap: () {
              // emit(ShowClubDetailsBottomSheet(clubs[i]));
              showInfoDialog(
                context: context,
                myImages: [
                  "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
                  "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
                  "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
                  "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
                  "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
                ],
                title: clubs[i].name,
                description: "${clubs[i].numOfFans} fans"
                    "القاهرة هي عاصمة جمهورية مصر العربية وأكبر وأهم مدنها على الإطلاق، وتعد أكبر مدينة عربية من حيث تعداد السكان والمساحة، وتحتل المركز الثاني أفريقياً والسابع عشر عالمياً من حيث التعداد السكاني، يبلغ عدد سكانها 9.7 مليون نسمة حسب إحصائيات عام 2018 يمثلون 10.6% من إجمالي تعداد سكان مصر.",
                onTap: () {
                  Navigator.pop(context);
                  emit(ShowClubDetailsBottomSheet(clubs[i]));

                  // Navigator.pop(context);
                  // _launchMap(
                  //   lat: double.parse('lat']),
                  //   lng: double.parse('lng']),
                  // );
                },
              );
            },
          ),
          // onTap: () => showInfoDialog(
          //   context: context,
          //   myImages: [
          //     "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
          //     "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
          //     "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
          //     "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
          //     "https://image.cnbcfm.com/api/v1/image/104819285-thor.jpg",
          //   ],
          //   title: 'title',
          //   description: 'info',
          //   onTap: () {
          //     // Navigator.pop(context);
          //     // _launchMap(
          //     //   lat: double.parse('lat']),
          //     //   lng: double.parse('lng']),
          //     // );
          //   },
          // ),
        ),
      );
    }
    emit(FillMarkers());
  }

  //set a custom icon for the club icon
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
