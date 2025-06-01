import "package:collection/collection.dart";
import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/coach_profile/coach_clubs_model.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

late Map<String, List<CoachClubsModel>> mapPerClubName;

class CoachClubsTab extends StatelessWidget {
  final List<CoachClubsModel> coachClubsList;
  const CoachClubsTab({required this.coachClubsList, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    mapPerClubName =
        groupBy(coachClubsList, (CoachClubsModel obj) => obj.clubName);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: mapPerClubName.length,
        itemBuilder: (BuildContext ctx, int index) {
          String clubName = mapPerClubName.keys.elementAt(index);
          var clubsList = mapPerClubName.values.elementAt(index);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: lightBlackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                    child: Text(
                      clubName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: width / 3.8,
                          decoration: BoxDecoration(
                            border: Border(
                              right: context.locale == Locale("en")
                                  ? BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    )
                                  : BorderSide.none,
                              left: context.locale == Locale("ar")
                                  ? BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                          child: Text(
                            LocaleKeys.general_years.tr(),
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
                          width: width / 1.77,
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "${assetImageBaseUrl}gold champions league.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: clubsList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width / 3.8,
                              child: Text(
                                clubsList[index].year,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0x99FBFBFB),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 1.7,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  clubsList[index].reward,
                                  style: TextStyle(
                                    color: Color(0x99FBFBFB),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
