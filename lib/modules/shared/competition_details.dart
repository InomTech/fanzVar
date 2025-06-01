// ignore_for_file: unused_field

import 'package:fanzhashem/modules/competitions/tabs/calender/competition_details_calender.dart';
import 'package:fanzhashem/modules/competitions/tabs/groups/competition_details_groups.dart';
import 'package:fanzhashem/modules/competitions/tabs/map/competition_details_map.dart';
import 'package:fanzhashem/modules/competitions/tabs/over_view/competition_details_overView.dart';
import 'package:fanzhashem/modules/shared/competition_details_widgets.dart';
import 'package:fanzhashem/modules/shared/competitions_rules.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../competitions/competation_knoutaut.dart';

class CompetitionDetails extends StatefulWidget {
  final competition;
  final history;
  const CompetitionDetails(
      {super.key, required this.history, required this.competition});

  @override
  _CompetitionDetailsState createState() => _CompetitionDetailsState();
}

class _CompetitionDetailsState extends State<CompetitionDetails>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;
  late TabController _tabControllers;

  late Widget moreWidget;
  int _activeIndex = 0;
  int _activeIndex2 = 0;

  List<String> popupMenuTxtList = [
    "Competitions Rules",
    "Matches Scores",
    "Sponsors",
    "Gallery"
  ];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabControllers = TabController(length: 2, vsync: this);

    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    _tabControllers.addListener(() {
      if (_tabControllers.indexIsChanging) {
        setState(() {
          _activeIndex2 = _tabControllers.index;
        });
      }
    });
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: appBar(
          _scaffoldKey,
          "Competition Details",
          // "${widget.competition.name}",
          context),
      backgroundColor: lightBlackColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompetitionHeader(
              competitionDueDate: "${widget.competition.dueDate}",
              competitionCity: "${widget.competition.city}",
              competitionCountry: "${widget.competition.country}",
              imagePath: "${assetImageBaseUrl}img.png",
              competitionName: "${widget.competition.name}",
              competitionStartDate: "${widget.competition.startDate}",
              competitionLocation: "${widget.competition.location}",
            ),
            SizedBox(height: 2),
            // sponsor(),
            SizedBox(height: 10),
            TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Image(
                    image: AssetImage("${assetImageBaseUrl}form.png"),
                    width: 28,
                    color: _activeIndex == 0 ? primaryColor : Colors.white,
                  ),
                ),
                Tab(
                  icon: Image(
                    image: AssetImage("${assetImageBaseUrl}Group 10261.png"),
                    width: 28,
                    color: _activeIndex == 1 ? primaryColor : Colors.white,
                  ),
                ),
                // Tab(
                //   icon: Icon(Icons.insert_drive_file_outlined),
                // ),
                // Tab(
                //   icon: Icon(Icons.group),
                // ),
                Tab(
                  icon: Icon(Icons.date_range),
                ),
                Tab(
                  icon: Icon(Icons.location_on),
                ),
                // Tab(
                //   icon: Icon(Icons.info_outline),
                // ),
                Tab(
                  icon: Image(
                    image: AssetImage("${assetImageBaseUrl}menu (1).png"),
                    width: 6,
                    color: _activeIndex == 4 ? primaryColor : Colors.white,
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CompetitionDetailsOverView(
                      competition: widget.competition, history: widget.history),
                  Column(
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: 'Groups',
                          ),
                          Tab(
                            text: 'Knockout',
                          )
                        ],
                        controller: _tabControllers,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            CompetitionDetailsGroup(
                                competition: widget.competition),
                            CompetationKnoutaut(),
                          ],
                          controller: _tabControllers,
                        ),
                      ),
                    ],
                  ),
                  CompetitionDetailsCalender(competition: widget.competition),
                  CompetitionDetailsMap(competition: widget.competition),
                  CompetitionsRules(competition: widget.competition)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showPopUpMenu(Offset globalPosition) async {
    double left = globalPosition.dx;
    double top = globalPosition.dy;
    await showMenu(
      color: lightBlackColor,
      //add your color
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem(
          value: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Text(
              popupMenuTxtList[0],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Text(
              popupMenuTxtList[1],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Text(
              popupMenuTxtList[2],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 40),
            child: Text(
              popupMenuTxtList[3],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
      elevation: 20.0,
    ).then((value) {
      print(value);
      setState(() {});
    });
  }
}
