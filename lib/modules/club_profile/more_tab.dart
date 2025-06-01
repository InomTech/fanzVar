import 'package:fanzhashem/models/club_profile/club_more_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../widgets/shared_widget.dart';
import '../club/club_profile.dart';

class MoreTab extends StatefulWidget {
  final List<ClubMoreModel> clubMore;
  final List<String>? clubYears;
  final teamPicture;
  const MoreTab(
      {super.key,
      required this.teamPicture,
      required this.clubMore,
      required this.clubYears});
  @override
  State<MoreTab> createState() => _MoreTabState();
}

var numOfChampoin, champoinName, founded, numOfFuns;
List<String>? years = [];

class _MoreTabState extends State<MoreTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    champoinName = widget.clubMore.map((e) => e).toList();
    numOfChampoin = widget.clubMore.map((e) => e.numOfChampoin);
    founded = widget.clubMore.map((e) => e.founded).toList();
    numOfFuns = widget.clubMore.map((e) => e.numOfFuns).toList();
    years = widget.clubYears;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
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
                            "Club Picture",
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
                          child: FullScreenWidget(
                            disposeLevel: DisposeLevel.Medium,
                            child: Container(
                              height: height / 7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.teamPicture),
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
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Founded',
            valueStr: widget.clubMore[0].founded,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Club Management Board',
            valueStr: widget.clubMore[0].managementBoardLink,
            clubManagement: true,
            isWebSite: true,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Champion Name',
            // valueStr: widget.clubMore.map((e) => e.champoinName).toString(),
            valueStr: widget.clubMore[0].champoinName,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Number Of Champions',
            valueStr: widget.clubMore[0].numOfChampoin,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Number Of Fans',
            valueStr: widget.clubMore[0].numOfFuns,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Number Of Projects',
            valueStr: widget.clubMore[0].numOfProjects,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Share Price',
            valueStr: widget.clubMore[0].sharePrice,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Point Value',
            valueStr: widget.clubMore[0].pointValue,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerListWidget(keyStr: 'Years Of Champoin', valueStr: years!),
          SizedBox(
            height: height / 30,
          ),
        ],
      ),
    );
  }
}
