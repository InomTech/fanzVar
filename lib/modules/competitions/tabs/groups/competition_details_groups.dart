import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsGroup extends StatefulWidget {
  final competition;
  const CompetitionDetailsGroup({super.key, required this.competition});

  @override
  _CompetitionDetailsGroupState createState() =>
      _CompetitionDetailsGroupState();
}

class _CompetitionDetailsGroupState extends State<CompetitionDetailsGroup> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(widget.competition.groups);
    return Scaffold(
      backgroundColor: darkBlackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount: widget.competition.groups!.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    groupItem(widget.competition.groups[index], width, height),
              );
            }),
      ),
    );
    // return Column(
    //   children: [
    //     SizedBox(
    //       height: height / 40,
    //     ),
    // Container(
    //   height: height / 15,
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: widget.competition.groups!.length,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       bool isSelected = selectedIndex == index;

    //       return Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: TxtButton(
    //           color: isSelected ? primaryColor : Colors.black,
    //           borderColor: primaryColor,
    //           text: "${widget.competition.groups![index].groupName}",
    //           borderRadius: 10,
    //           onPressed: () {
    //             setState(() {
    //               selectedIndex = index;
    //             });
    //           },
    //           horizontalPadding: width / 17,
    //           verticalPadding: 0,
    //         ),
    //       );
    //     },
    //   ),
    // ),
    // Flexible(
    //   fit: FlexFit.tight,
    //   child: GroupItem(
    //     competition: widget.competition,
    //     indx: selectedIndex,
    //   ),
    // )
    //     ],
    //   );
  }
}

/// ====================== Group Item =============================

Widget groupItem(group, width, height) {
  List clubs = group.teams;
  // ["teams"];
  return ExpansionTile(
    backgroundColor: lightBlackColor,
    collapsedBackgroundColor: lightBlackColor,
    title: Text(
      group.groupName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      textAlign: TextAlign.left,
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height / 18,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: primaryColor,
            // border: Border.all(color: Color(0xFF424242)),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 3,
                // color: Colors.red,
                child: Text(
                  'CLUB',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: width / 2.6,
                child: Row(
                  children: [
                    Text('W',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                    Spacer(flex: 2),
                    Text('D',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                    Spacer(flex: 2),
                    Text('L',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                    Spacer(flex: 2),
                    Text('PTS',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ================= Clubs ======================
      ListView.builder(
          shrinkWrap: true,
          itemCount: clubs.length,
          itemBuilder: (BuildContext context, int index) {
            return clubItem(clubs[index].teamName, clubs[index].toString(),
                index, height, width);
          }),
    ],
  );
}

/// ======================= Club Item ===========================
Widget clubItem(clubName, clubID, index, height, width) {
  List clubColors = [
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.pink,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.green
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: height / 18,
      width: width, // double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  border: Border.all(color: Color(0xFF424242)),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 12, top: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: width / 12,
                        // color: Colors.red,   //clubID
                        child:
                            Text('${index + 1}', textAlign: TextAlign.center),
                      ),
                      SizedBox(
                          width: width / 2.5,
                          child: Text(clubName ?? 'Club Name')),
                      SizedBox(
                          width: width / 10,
                          child: Text('8', textAlign: TextAlign.left)),
                      SizedBox(
                          width: width / 12,
                          // color: Colors.blue,
                          child: Text('0', textAlign: TextAlign.center)),
                      SizedBox(
                          width: width / 11,
                          // color: Colors.red,
                          child: Text('0', textAlign: TextAlign.right)),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: height / 15,
                  width: 8,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: clubColors[index] ?? Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(width: 3),
          Expanded(
            child: Container(
              height: height / 15,
              decoration: BoxDecoration(
                color: lightBlackColor,
                border: Border.all(color: Color(0xFF424242)),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Center(
                child: Text(
                  '24',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class GroupItem extends StatelessWidget {
  final competition;
  final int indx;
  const GroupItem({super.key, required this.competition, required this.indx});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final teams = competition.groups![indx].teams;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height / 2.5,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: teams!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: darkBlackColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(
                                      10.0), //                 <--- border radius here
                                ),
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // width: width / 2,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "${teams[index].teamName}",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                )),
                                          ),
                                          SizedBox(height: 2),
                                          Container(
                                            width: width / 4,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                "${teams[index].league}",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12.0,
                                                )),
                                          ),
                                          SizedBox(height: 2),
                                          StarRatingWidget(
                                              initialRating:
                                                  teams[index].rate!),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white70,
                                        size: 20,
                                      )
                                    ]))),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
