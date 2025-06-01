import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/coach_profile/coach_profile_model.dart';
import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/modules/club_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/club_profile/cubit/states.dart';
import 'package:fanzhashem/modules/club_profile/first_tab.dart';
import 'package:fanzhashem/modules/club_profile/more_tab.dart';
import 'package:fanzhashem/modules/club_profile/players_tab.dart';
import 'package:fanzhashem/modules/club_profile/scorres_goal_tab.dart';
import 'package:fanzhashem/modules/club_profile/second_tab.dart';
import 'package:fanzhashem/modules/club_profile/third_tab.dart';
import 'package:fanzhashem/modules/coach_profile/coach_profile_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'club_projects_tab.dart';

class ClubProfileScreen extends StatefulWidget {
  final GeneralMatchModel info;
  final bool isFirstTeam;
  final bool? isCountry;
  const ClubProfileScreen(
      {required this.info,
      this.isCountry,
      this.isFirstTeam = false,
      super.key});

  @override
  State<ClubProfileScreen> createState() => _ClubProfileScreenState();
}

class _ClubProfileScreenState extends State<ClubProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late CoachProfileModel coachInfo;
  int _activeIndex = 0;
  List sponsors = [];

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String playerImg = widget.isFirstTeam == true
        ? widget.info.firstTeamCoachAvatar
        : widget.info.secondTeamCoachAvatar;

    return BlocProvider(
      create: (BuildContext context) => ClubProfileCubit()
        ..getCoachProfileInfo(widget.isFirstTeam == true
            ? widget.info.firstTeamCoachId
            : widget.info.secondTeamCoachId)
        ..getSponsors('other_sport'),
      child: BlocConsumer<ClubProfileCubit, ClubProfileStates>(
        listener: (context, state) {
          if (state is GetCoachProfileState) {
            coachInfo = state.coachProfile;
          }
          if (state is GetSponsorsState) {
            sponsors = state.sponsors[0];
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: widget.isCountry != true
                  ? Text(context.locale == Locale('en')
                      ? "Club Profile"
                      : "الملف الشخصي للنادي")
                  : Text(context.locale == Locale('en')
                      ? "Country Profile"
                      : "الملف الشخصي للدوله"),
              // Text(widget.isFirstTeam == true
              //     ? widget.info.firstTeamName
              //     : widget.info.secondTeamName),
              centerTitle: true,
              backgroundColor: lightBlackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),

              leading: IconButton(
                icon: Transform.rotate(
                  angle: context.locale == Locale('en')
                      ? 180 * math.pi
                      : 180 * math.pi / 180,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: width / 2.0,
                          child: ListTile(
                            horizontalTitleGap: 3,
                            leading: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  widget.isFirstTeam == true
                                      ? widget.info.firstTeamAvatar
                                      : widget.info.secondTeamAvatar),
                            ),
                            title: Text(widget.isFirstTeam == true
                                ? widget.info.firstTeamName
                                : widget.info.secondTeamName),
                            subtitle: Text(widget.isFirstTeam == true
                                ? widget.info.firstTeamCountry
                                : widget.info.secondTeamCountry),
                          ),
                        ),
                        SizedBox(
                          width: width / 2.2,
                          child: ListTile(
                            onTap: () {
                              // if (coachInfo != nu)
                              navigateTo(
                                context,
                                CoachProfileScreen(
                                  coachID: widget.isFirstTeam == true
                                      ? widget.info.firstTeamCoachId
                                      : widget.info.secondTeamCoachId,
                                  clubName: widget.isFirstTeam == true
                                      ? widget.info.firstTeamName
                                      : widget.info.secondTeamName,
                                  country: widget.isFirstTeam == true
                                      ? widget.info.firstTeamCountry
                                      : widget.info.secondTeamCountry,
                                  coachInfo: coachInfo,
                                ),
                              );
                              // navigateTo(
                              //   context,
                              //   PlayerProfileScreen(
                              //     playerID: widget.isFirstTeam == true
                              //         ? widget.info.firstTeamCoachId
                              //         : widget.info.secondTeamCoachId,
                              //   ),
                              // );
                            },
                            horizontalTitleGap: 10,
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(playerImg),
                              // //AssetImage(
                              //   "$assetImageBaseUrl$playerImg",
                              // ),
                            ),
                            title: Text(widget.isFirstTeam == true
                                ? widget.info.firstTeamCoach
                                : widget.info.secondTeamCoach),
                            subtitle: Text(context.locale == Locale('en')
                                ? "Coach"
                                : "مدرب"),
                          ),
                        ),
                      ],
                    ),
                    sponsor(sponsors, lightBlackColor),
                    SizedBox(height: 10),

                    /// ================== Tabs ==================
                    TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: primaryColor,
                      indicatorColor: primaryColor,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Group 10261.png"),
                            width: 28,
                            color:
                                _activeIndex == 0 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Group 10561.png"),
                            width: 28,
                            color:
                                _activeIndex == 1 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Icon awesome-newspaper.png"),
                            width: 22,
                            color:
                                _activeIndex == 2 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person_outline_rounded,
                            size: 30,
                            color:
                                _activeIndex == 3 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage("${assetImageBaseUrl}Star.png"),
                            width: 28,
                            color:
                                _activeIndex == 4 ? primaryColor : Colors.white,
                          ),
                          // text: 'Expect',
                        ),
                        Tab(
                          icon: Image(
                            image:
                                AssetImage("${assetImageBaseUrl}menu (1).png"),
                            width: 6,
                            color:
                                _activeIndex == 5 ? primaryColor : Colors.white,
                          ),
                          // text: 'News',
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Group 10561.png"),
                            width: 28,
                            color:
                                _activeIndex == 6 ? primaryColor : Colors.white,
                          ),
                        )
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          FirstTab(
                            clubMatches: widget.isFirstTeam == true
                                ? widget.info.firstTeamMatches
                                : widget.info.secondTeamMatches,
                          ),
                          SecondTab(
                            clubs: widget.isFirstTeam == true
                                ? widget.info.firstTeamClubs
                                : widget.info.secondTeamClubs,
                          ),
                          ThirdTab(
                            clubNews: widget.isFirstTeam == true
                                ? widget.info.firstTeamNews
                                : widget.info.secondTeamNews,
                          ),
                          PlayerTab(
                            goolkeeper: widget.isFirstTeam == true
                                ? widget.info.firstClubGoalKeeper
                                : widget.info.secondClubGoalKeeper,
                            defender: widget.isFirstTeam == true
                                ? widget.info.firstClubDefender
                                : widget.info.secondClubDefender,
                            center: widget.isFirstTeam == true
                                ? widget.info.firstClubCenter
                                : widget.info.secondClubCenter,
                            attack: widget.isFirstTeam == true
                                ? widget.info.firstClubAttack
                                : widget.info.secondClubAttack,
                          ),
                          ScorresGoalTab(
                              scorregoal: widget.isFirstTeam == true
                                  ? widget.info.firstClubGoalScorres
                                  : widget.info.secondClubGoalScorres),
                          MoreTab(
                              clubMore: widget.isFirstTeam == true
                                  ? widget.info.firstClubMore
                                  : widget.info.secondClubMore,
                              teamPicture: widget.isFirstTeam == true
                                  ? widget.info.firstTeamAvatar
                                  : widget.info.secondTeamAvatar,
                              clubYears: widget.isFirstTeam == true
                                  ? widget.info.firstClubYears
                                  : widget.info.secondClubYears),
                          ClubProjectsTab(
                            sugesstedProjects: widget.isFirstTeam == true
                                ? widget.info.firstsugesstedProjects
                                : widget.info.secondsugesstedProjects,
                            inprogressProjects: widget.isFirstTeam == true
                                ? widget.info.firstinprogressProjects
                                : widget.info.secondinprogressProjects,
                            finishedProjects: widget.isFirstTeam == true
                                ? widget.info.firstfinishedProjects
                                : widget.info.secondfinishedProjects,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
