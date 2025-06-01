import 'package:fanzhashem/models/club_profile/clubs_tab_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  final List<ClubsTabModel> clubs;
  const SecondTab({required this.clubs, super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          color: darkBlackColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: width / 8,
                child: Text(
                  "POS",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
              ),
              SizedBox(
                width: width / 2.6,
                // color: Colors.blue,
                child: Text(
                  "Club",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
              ),
              SizedBox(
                width: width / 7,
                // color: Colors.red,
                child: Text(
                  "P",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
              ),
              SizedBox(
                width: width / 7,
                // color: Colors.green,
                child: Text(
                  "GD",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
              ),
              SizedBox(
                width: width / 7,
                // color: Colors.red,
                child: Text(
                  "PTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: clubs.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.5),
                child: Item(width: width, height: height, club: clubs[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final double width, height;
  final ClubsTabModel club;
  const Item(
      {required this.width,
      required this.height,
      required this.club,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 15,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: lightBlackColor,
      child: Row(
        children: [
          SizedBox(
            width: width / 8,
            child: Text(
              club.pos,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x99FBFBFB)),
            ),
          ),
          SizedBox(
            width: width / 2.6,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage("$assetImageBaseUrl${club.clubImg}"),
                ),
                const SizedBox(width: 3),
                Text(
                  club.club,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0x99FBFBFB)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width / 7,
            child: Text(
              club.p,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x99FBFBFB)),
            ),
          ),
          SizedBox(
            width: width / 7,
            child: Text(
              club.gd,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x99FBFBFB)),
            ),
          ),
          SizedBox(
            width: width / 7,
            child: Text(
              club.pts,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x99FBFBFB)),
            ),
          ),
        ],
      ),
    );
  }
}
