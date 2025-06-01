// ignore_for_file: unused_field, duplicate_ignore, override_on_non_overriding_member

import 'dart:async';

import 'package:fanzhashem/models/clubs_model.dart';
import 'package:fanzhashem/modules/club/club_widget.dart';
import 'package:fanzhashem/modules/map/cubit/cubit.dart';
import 'package:fanzhashem/modules/map/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../ranking/ranking_screen.dart';

class MapScreen extends StatefulWidget {
  final String countryValue;
  final String? cityValue;
  final String? stateValue;

  const MapScreen(
      {super.key, required this.countryValue, this.cityValue, this.stateValue});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // MapPickerController mapPickerController = MapPickerController();

  final TextEditingController countryCtrl = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late CameraPosition newcameraPosition;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state $state");
    if (state == AppLifecycleState.resumed) {
      print("resumed");
      BlocProvider.of<MapCubit>(context).getInitialCameraPosition();
    } else if (state == AppLifecycleState.inactive) {
      print("inactive");
    } else if (state == AppLifecycleState.paused) {
      print("paused");
    } else if (state == AppLifecycleState.detached) {
      print("detached");
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<MapCubit>(
      create: (context) => MapCubit()
        ..getInitialCameraPosition()
        ..getCountries(),
      child: BlocConsumer<MapCubit, MapStates>(
        listener: (context, state) async {
          if (state is GetCurrentLatLng) {
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(
                      state.latitude,
                      state.longitude,
                    ),
                    zoom: 13)));

            BlocProvider.of<MapCubit>(context)
                .getLatLng(state.latitude, state.longitude);
          }

          if (state is SelectCountry) {
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(
                        BlocProvider.of<MapCubit>(context)
                                .selectedCountry!
                                .latitude ??
                            0.0,
                        BlocProvider.of<MapCubit>(context)
                                .selectedCountry!
                                .longitude ??
                            0.0))));

            print("Select Country");

            print(BlocProvider.of<MapCubit>(context).selectedCountry!.latitude);
          }

          if (state is GetLatLng) {
            BlocProvider.of<MapCubit>(context)
                .getAddressFromLatLng(state.latitude, state.longitude);
          }

          if (state is GetAddressFromLatLng) {
            countryCtrl.text = state.country;
            BlocProvider.of<MapCubit>(context).getClubs(context);
          }
          if (state is ShowClubDetailsBottomSheet) {
            // showAsBottomSheet(context, width, height, state.clubDetails);
            // navigateTo(context, TeamsRanking());
            navigateTo(context, RankingScreen());
          }
          if (state is DeterminePermission) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            showToast(
                msg:
                    "User denied permissions to access the device's location.");
          }
        },
        builder: (context, state) {
          final mapCubit = BlocProvider.of<MapCubit>(context);
          return SafeArea(
            child: Scaffold(
              body:
                  //  Visibility(
                  // visible: mapCubit.permissionAllowed == true,
                  // child:
                  !mapCubit.isLoading
                      ? Stack(
                          children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 25.0, right: 20, left: 20),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: darkBlackColor,
                                          )),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            height: height / 18,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0)),
                                              color: lightBlackColor,
                                              border: Border.all(
                                                  color: lightBlackColor),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          mapCubit.getCurrentLatLng();
                                        },
                                        child: CircleAvatar(
                                            backgroundColor: lightBlackColor,
                                            radius: 25,
                                            child: Icon(
                                              Icons.my_location,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      : ShowLoading(
                          isLoading: true,
                        ),
              // ),
              // floatingActionButton: FloatingActionButton.extended(
              //   onPressed: () async {
              //     showAsBottomSheet(context, width, height,
              //         BlocProvider.of<MapCubit>(context));
              //   },
              //   backgroundColor: primaryColor,
              //   label: Text(
              //     'Show Clubs',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   //icon: Icon(Icons.directions_boat,color: Colors.white,),
              // ),
            ),
          );
        },
      ),
    );
  }

  void showAsBottomSheet(context, width, height, ClubsModel club) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.25,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
              color: lightBlackColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClubWidget(
                  club: club,
                  clubLocation: countryCtrl.text,
                ),
              ));
        },
      ),
    );
  }
}
