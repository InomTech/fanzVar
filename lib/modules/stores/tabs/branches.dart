import 'dart:async';

import 'package:fanzhashem/models/stores_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Branches extends StatelessWidget {
  final List<BranchModel> branches;

  const Branches({super.key, required this.branches});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: BranchItem(
              branch: branches[index],
              branchIndex: index,
            ),
          );
        },
      ),
    );
  }
}

class BranchItem extends StatefulWidget {
  final BranchModel branch;
  final int branchIndex;

  const BranchItem(
      {super.key, required this.branch, required this.branchIndex});

  @override
  State<BranchItem> createState() => _BranchItemState();
}

class _BranchItemState extends State<BranchItem> {
  final Completer<GoogleMapController> _controller = Completer();

  var markers;

  var cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    markers = {
      Marker(
        markerId: MarkerId("address_position"),
        position: LatLng(double.parse(widget.branch.latitude.toString()),
            double.parse(widget.branch.longitude.toString())),
      )
    };

    cameraPosition = CameraPosition(
        target: LatLng(double.parse(widget.branch.latitude.toString()),
            double.parse(widget.branch.longitude.toString())),
        zoom: 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: darkBlackColor,
        border: Border.all(color: lightBlackColor),
      ),
      child: ListTile(
        title: Text(
          "Branch ${widget.branchIndex + 1}",
          softWrap: true,
          style: TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
        ),
        subtitle: Column(
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
                  Container(
                    width: width / 1.7,
                    alignment: Alignment.center,
                    child: Text(widget.branch.address ?? "",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: height / 4,
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: GoogleMap(
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                          // hide location button
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          markers: markers,
                          myLocationButtonEnabled: false,
                          mapType: MapType.normal,
                          myLocationEnabled: false,
                          initialCameraPosition: cameraPosition,
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
