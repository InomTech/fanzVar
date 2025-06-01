import 'package:fanzhashem/modules/champion/champion_comments.dart';
import 'package:fanzhashem/modules/champion/champion_details.dart';
import 'package:fanzhashem/modules/champion/champion_groups.dart';
import 'package:fanzhashem/modules/champion/champion_info.dart';
import 'package:fanzhashem/modules/champion/champion_matches.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/club_profile/club_play_list_model.dart';
import '../../widgets/scorres_goals_widget.dart';
import 'champion_knoutaut.dart';
import 'champoin_ranking.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChampionOverviewScreen extends StatefulWidget {
  final championDetails, champion;
  const ChampionOverviewScreen(
      {required this.champion, required this.championDetails, super.key});

  @override
  State<ChampionOverviewScreen> createState() => _ChampionOverviewScreenState();
}

class _ChampionOverviewScreenState extends State<ChampionOverviewScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  late TabController _tabControllers;

  int _activeIndex = 0;
  // ignore: unused_field
  int _activeIndex2 = 0;
  int leng = 7;
  List championMatches = [];
  List championGroups = [];
  List championRanking = [];
  List<FirstClubAttackModel> goalsScorres = [];

  @override
  void initState() {
    print(widget.champion);
    print(widget.championDetails["hasSchedual"]);
    print(widget.championDetails["hasSchedual"]);
    widget.championDetails["hasSchedual"] == true ? print(7) : print(6);
    _tabController = TabController(
        length: widget.championDetails["hasSchedual"] == true ? 7 : 6,
        vsync: this);
    _tabControllers = TabController(
        length: widget.championDetails["hasSchedual"] == true ? 1 : 2,
        vsync: this);
    super.initState();
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
    return BlocProvider(
      create: (BuildContext context) => ChampionCubit()
        ..getChampionMatchesAndGroups(
            categoryID: widget.champion["CategoryID"],
            championID: widget.championDetails["ChampionID"]),
      child: BlocConsumer<ChampionCubit, ChampionStates>(
          listener: (context, state) async {
        if (state is GetChampionMatchesAndGroupsState) {
          championMatches = state.championMatches;
          championGroups = state.championGroups;
          championRanking = state.championRanking;
          goalsScorres = List<FirstClubAttackModel>.from(state
              .championgoalsScorres[0]
              .map((x) => FirstClubAttackModel.fromJson(x)));
        }
      }, builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: appBar(_scaffoldKey, "Champion details", context),
          backgroundColor: lightBlackColor,
          body: SafeArea(
            child: widget.championDetails["hasSchedual"] == true
                ? Column(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Image.asset(
                            //   '${assetImageBaseUrl}trophy.png',
                            //   width: 40,
                            //   height: 40,
                            //   color: primaryColor,
                            // ),
                            Center(
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  widget.championDetails['Avatar'] ??
                                      "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
                                ),
                                //backgroundImage: AssetImage("assets/images/saib.png"),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.championDetails['Name'],
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13),
                      TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            icon: Image(
                              image: AssetImage("${assetImageBaseUrl}form.png"),
                              width: 28,
                              color: _activeIndex == 0
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage("${assetImageBaseUrl}Star.png"),
                              width: 28,
                              color: _activeIndex == 1
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10261.png"),
                              width: 28,
                              color: _activeIndex == 2
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10259.png"),
                              width: 22,
                              color: _activeIndex == 3
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10561.png"),
                              width: 28,
                              color: _activeIndex == 4
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage("${assetImageBaseUrl}Star.png"),
                              width: 28,
                              color: _activeIndex == 5
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}menu (1).png"),
                              width: 6,
                              color: _activeIndex == 6
                                  ? primaryColor
                                  : Colors.white,
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
                            ChampionInfo(
                              championFirstMatche: championMatches.length > 0
                                  ? championMatches.first
                                  : null,
                              championDetails: widget.championDetails,
                            ),
                            ChampionRanking(
                              championRanking: championRanking,
                              championDetails: widget.championDetails,
                            ),
                            Column(
                              children: [
                                TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: primaryColor,
                                  indicatorColor: primaryColor,
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  tabs: [
                                    Tab(
                                      text: 'Groups',
                                    )
                                  ],
                                  controller: _tabControllers,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      ChampionGroups(
                                        championGroups: championGroups,
                                        championDetails: widget.championDetails,
                                      )
                                    ],
                                    controller: _tabControllers,
                                  ),
                                ),
                              ],
                            ),
                            ChampionMatches(
                              championMatches: championMatches,
                              championDetails: widget.championDetails,
                            ),
                            ScorresGoalsWidget(scorregoal: goalsScorres),
                            ChampionComments(
                              championComments:
                                  widget.championDetails["Comments"],
                            ),
                            ChampionDetails(
                                championDetails: widget.championDetails),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Image.asset(
                            //   '${assetImageBaseUrl}trophy.png',
                            //   width: 40,
                            //   height: 40,
                            //   color: primaryColor,
                            // ),
                            Center(
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  widget.championDetails['Avatar'] ??
                                      "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
                                ),
                                //backgroundImage: AssetImage("assets/images/saib.png"),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.championDetails['Name'],
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13),
                      TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            icon: Image(
                              image: AssetImage("${assetImageBaseUrl}form.png"),
                              width: 28,
                              color: _activeIndex == 0
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10261.png"),
                              width: 28,
                              color: _activeIndex == 2
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10259.png"),
                              width: 22,
                              color: _activeIndex == 3
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}Group 10561.png"),
                              width: 28,
                              color: _activeIndex == 4
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage("${assetImageBaseUrl}Star.png"),
                              width: 28,
                              color: _activeIndex == 5
                                  ? primaryColor
                                  : Colors.white,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage(
                                  "${assetImageBaseUrl}menu (1).png"),
                              width: 6,
                              color: _activeIndex == 6
                                  ? primaryColor
                                  : Colors.white,
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
                            ChampionInfo(
                              championFirstMatche: championMatches.length > 0
                                  ? championMatches.first
                                  : null,
                              championDetails: widget.championDetails,
                            ),
                            // ChampionRanking(
                            //         championRanking: championRanking,
                            //         championDetails: widget.championDetails,
                            //       )
                            //     ,
                            Column(
                              children: [
                                TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: primaryColor,
                                  indicatorColor: primaryColor,
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                      ChampionGroups(
                                        championGroups: championGroups,
                                        championDetails: widget.championDetails,
                                      ),
                                      ChampionKnoutaut(
                                          championId: widget
                                              .championDetails["ChampionID"]),
                                    ],
                                    controller: _tabControllers,
                                  ),
                                ),
                              ],
                            ),
                            ChampionMatches(
                              championMatches: championMatches,
                              championDetails: widget.championDetails,
                            ),
                            ScorresGoalsWidget(scorregoal: goalsScorres),
                            ChampionComments(
                              championComments:
                                  widget.championDetails["Comments"],
                            ),
                            ChampionDetails(
                                championDetails: widget.championDetails),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
