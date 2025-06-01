import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/coach_profile/coach_profile_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class CoachInfoTab extends StatelessWidget {
  final CoachProfileModel coachInfo;
  const CoachInfoTab({required this.coachInfo, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // color: lightBlackColor,
      child: ListView(
        // shrinkWrap: true,
        children: [
          SizedBox(height: 8),
          overviewWidget(context.locale == Locale('en') ? "Age :" : "السن",
              '${coachInfo.age}  years', width),
          overviewWidget(context.locale == Locale('en') ? "Height :" : "الطول:",
              coachInfo.height, width),
          overviewWidget(context.locale == Locale('en') ? "Team :" : "الفريق:",
              coachInfo.team, width),
          overviewWidget(
              context.locale == Locale('en') ? "Position :" : "Position :",
              coachInfo.position,
              width),
          overviewWidget(context.locale == Locale('en') ? "Shirt :" : "Shirt :",
              coachInfo.shirt, width),
          overviewWidget(
              context.locale == Locale('en') ? "Country :" : "الدوله:",
              coachInfo.city,
              width),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget overviewWidget(String title, String val, double width) {
    return Container(
      color: lightBlackColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: lightBlackColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Padding(
            // padding: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: width / 5,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
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
      ),
    );
  }
}
