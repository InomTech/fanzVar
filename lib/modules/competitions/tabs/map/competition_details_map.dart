import 'dart:async';

import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompetitionDetailsMap extends StatelessWidget {
  final competition;
  const CompetitionDetailsMap({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> controller = Completer();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: primaryColor,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text("${competition.location}",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: height / 4,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: GoogleMap(
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  // hide location button
                  onMapCreated: (GoogleMapController controller) {
                    // controller.complete(controller);
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId("address_position"),
                      position:
                          LatLng(competition.latitude!, competition.longitude!),
                    )
                  },
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  myLocationEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target:
                          LatLng(competition.latitude!, competition.longitude!),
                      zoom: 13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
