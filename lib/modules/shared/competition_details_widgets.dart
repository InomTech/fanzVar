// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/fullScreen_image.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class CompetitionHeader extends StatelessWidget {
  final String imagePath;
  final String competitionName;
  final String competitionStartDate;
  final String competitionDueDate;
  final String competitionLocation;
  final String competitionCity;
  final String competitionCountry;

  const CompetitionHeader(
      {super.key,
      required this.competitionCity,
      required this.competitionCountry,
      required this.imagePath,
      required this.competitionName,
      required this.competitionStartDate,
      required this.competitionDueDate,
      required this.competitionLocation});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(right: 5, top: 10, left: 5, bottom: 0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.3,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                  Container(
                    alignment: Alignment.topCenter,
                    // margin:
                    //     EdgeInsets.only(right: 5, top: 30, left: 5, bottom: 0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 18),
                        Text(
                          competitionName,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            child: Text(
                              "Start Date : $competitionStartDate  -  Due Date : $competitionDueDate   ",
                              // LocaleKeys.competitions_screen_start_date
                              //     .tr(args: [competitionStartDate]),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
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
                        SizedBox(width: 5),
                        Text(
                            //competitionLocation,
                            "$competitionCountry - $competitionCity",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            )),
                      ],
                    ),
                  ),

                  SizedBox(height: height / 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// matches

class Match extends StatelessWidget {
  final String firstTeamName;
  final String firstTeamScore;
  final String secondTeamName;
  final String secondTeamScore;
  final String matchDate;

  const Match(
      {super.key,
      required this.firstTeamName,
      required this.firstTeamScore,
      required this.secondTeamName,
      required this.secondTeamScore,
      required this.matchDate});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(
                          10.0), //                 <--- border radius here
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 50),
                              child: SizedBox(
                                width: width / 4,
                                child: Text(firstTeamName,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                    )),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(matchDate,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0,
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 50,
                                ),
                                Text("$firstTeamScore - $secondTeamScore",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 50),
                              child: SizedBox(
                                width: width / 4,
                                child: Text(secondTeamName,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                    )),
                              ),
                            ),
                          ]))),
            ),
          ],
        ));
  }
}

/// Gallery

class GalleryGridView extends StatelessWidget {
  final List<String> galleryImages;
  final bool isFullScreen;

  const GalleryGridView(
      {super.key, required this.galleryImages, this.isFullScreen = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(galleryImages[0]);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
          height: height / (isFullScreen ? 1 : 8),
          width: width,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  navigateTo(
                      context,
                      FullScreenImage(
                        imagePath: galleryImages[index],
                      ));
                },
                child: Container(
                  //"${assetImageBaseUrl}img.png"
                  width: 40,
                  height: 40,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    //color: containerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(galleryImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: galleryImages.length,
          )),
    );
  }
}
