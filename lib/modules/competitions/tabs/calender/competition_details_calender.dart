import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsCalender extends StatefulWidget {
  final competition;
  const CompetitionDetailsCalender({super.key, required this.competition});
  @override
  _CompetitionDetailsCalenderState createState() =>
      _CompetitionDetailsCalenderState();
}

class _CompetitionDetailsCalenderState
    extends State<CompetitionDetailsCalender> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final groupsResult = widget.competition.groupResult;
    return Column(
      children: [
        SizedBox(
          height: height / 40,
        ),
        SizedBox(
          height: height / 15,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: groupsResult!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: TxtButton(
                  color: isSelected ? primaryColor : Colors.black,
                  borderColor: primaryColor,
                  text: groupsResult[index].groupName!,
                  borderRadius: 10,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  horizontalPadding: width / 17,
                  verticalPadding: 0,
                ),
              );
            },
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: GroupItem(
            competition: widget.competition,
            inx: selectedIndex,
          ),
        )
      ],
    );
  }
}

class GroupItem extends StatelessWidget {
  final competition;
  final int inx;
  const GroupItem({super.key, required this.competition, required this.inx});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final teams = competition.groupResult![inx].teams;

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
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(
                                10.0), //                 <--- border radius here
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(
                                10.0), //                 <--- border radius here
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 10,
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
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: width / 4,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "${teams[index].firstTeamName}",
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15.0,
                                            )),
                                      ),
                                      Text(
                                          "${teams[index].firstTeamScore} - ${teams[index].secondTeamScore}",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          )),
                                      Container(
                                        width: width / 4,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "${teams[index].secondTeamName}",
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15.0,
                                            )),
                                      ),
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
