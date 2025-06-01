import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../club/club_profile.dart';

class CompetitionsRules extends StatelessWidget {
  final competition;
  const CompetitionsRules({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 5,
              width: double.infinity,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: darkBlackColor,
                // border: Border.all(color: Color(0xFF424242)),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        width: width / 1.1,
                        child: Center(
                          child: Text(
                            "${competition.marketingAgency}",
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 5.0, right: 5.0),
                        width: width / 1.14,
                        child: Center(
                          child: Align(
                            child: Container(
                              height: height / 8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${competition.marketingAgencyImage}"),
                                  // fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ContainerWidget(
              keyStr: 'Competitions Rules',
              valueStr: "${competition.competitionRules}",
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Competitions Rules",
            //   style: TextStyle(
            //       fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "${competition.competitionRules}",
            //     style: TextStyle(
            //         fontSize: 12,
            //         color: Colors.white70,
            //         fontWeight: FontWeight.normal),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
