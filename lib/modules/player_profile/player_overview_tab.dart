import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class PlayerOverviewTab extends StatelessWidget {
  final playerInfo;
  const PlayerOverviewTab({required this.playerInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 8),

        overviewWidget("Naionalty :", playerInfo["country"]),
        // overviewWidget("league :", playerInfo["league"]),
        overviewWidget("Age :", playerInfo["age"]),

        overviewWidget("Height :", playerInfo["Height"]),
        overviewWidget("Weight :", playerInfo["Weight"]),
        overviewWidget("Team :", playerInfo["team"]),
        overviewWidget("Position :", playerInfo["position"]),
        overviewWidget("Shirt :", playerInfo["shirt"]),
        SizedBox(height: 8),
      ],
    );
  }

  Widget overviewWidget(String title, String val) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 10),
              Text(
                val,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
