import 'package:fanzhashem/models/coach_profile/coach_teams_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

class CoachTeamsTab extends StatelessWidget {
  final List<CoachTeamsModel> coachTeamsList;
  const CoachTeamsTab({required this.coachTeamsList, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Column(
        children: [
          Container(
            color: Color(0xFF202020),
            height: 35,
            child: Row(
              children: [
                SizedBox(
                  width: width / 3.8,
                  child: Text(
                    "Years",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 2.1,
                  child: Text(
                    "Teams",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 5,
                  child: Text(
                    "Nat.",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///=======================
          ListView.builder(
            shrinkWrap: true,
            itemCount: coachTeamsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: lightBlackColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(children: [
                    SizedBox(
                      width: width / 3.8,
                      child: Text(
                        coachTeamsList[index].year,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x99FBFBFB),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                        width: width / 2.1,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            left: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: darkBlackColor,
                              backgroundImage: AssetImage(
                                  "$assetImageBaseUrl${coachTeamsList[index].teamAvatar}"),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              coachTeamsList[index].teamName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x99FBFBFB),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      width: width / 5,
                      child: Image.asset(
                        "$assetImageBaseUrl${coachTeamsList[index].flag}",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
