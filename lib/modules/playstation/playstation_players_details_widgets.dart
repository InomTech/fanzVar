import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

/// playStationPlayer header

class PlayStationPlayerHeader extends StatelessWidget {
  final String imagePath;
  final String playStationPlayerName;
  final String playStationPlayerLocation;

  const PlayStationPlayerHeader(
      {super.key,
      required this.imagePath,
      required this.playStationPlayerName,
      required this.playStationPlayerLocation});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
        margin: const EdgeInsets.only(right: 5, top: 10, left: 5, bottom: 0),
        child: Stack(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4.3,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    //color: containerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.colorBurn),
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.only(right: 5, top: 3, left: 5, bottom: 0),
                  padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 25),
                  child: Column(
                    children: <Widget>[
                      // title

                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(
                            right: 5, top: 30, left: 5, bottom: 0),
                        child: Column(
                          children: [
                            Text(playStationPlayerName,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                )),
                          ],
                        ),
                      ),

                      Spacer(),

                      // details

                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(
                            right: 5, top: 0, left: 5, bottom: 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(playStationPlayerLocation,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                )),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height / 50,
                      ),
                    ],
                  )))
        ]));
  }
}
