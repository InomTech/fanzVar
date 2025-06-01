import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/coach_profile/coach_profile_model.dart';
// import 'package:fanzvar/modules/coach_profile/coach_audians_tab.dart';
import 'package:fanzhashem/modules/coach_profile/coach_clubs_tab.dart';
import 'package:fanzhashem/modules/coach_profile/coach_info_tab.dart';
import 'package:fanzhashem/modules/coach_profile/coach_news_tab.dart';
import 'package:fanzhashem/modules/coach_profile/coach_teams_tab.dart';
import 'package:fanzhashem/modules/coach_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/coach_profile/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:percent_indicator/linear_percent_indicator.dart';

class CoachProfileScreen extends StatefulWidget {
  final String coachID, clubName, country;
  final CoachProfileModel coachInfo;
  const CoachProfileScreen(
      {required this.coachInfo,
      required this.coachID,
      required this.clubName,
      required this.country,
      super.key});

  @override
  _CoachProfileScreenState createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  int _activeIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
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

    print(widget.coachInfo);
    return BlocProvider(
      create: (BuildContext context) => CoachProfileCubit(),
      child: BlocConsumer<CoachProfileCubit, CoachProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            double width = MediaQuery.of(context).size.width;
            double percent = .5;
            double percentage = .1;
            return Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(context.locale == Locale('en')
                    ? "Coach Profile"
                    : "الملف الشخصي للمدرب"),
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
              backgroundColor: darkBlackColor,
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            "$assetImageBaseUrl${widget.coachInfo.coachAvatar}",
                          ),
                        ),
                        const SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.coachInfo.coachName,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              context.locale == Locale('en') ? "Coach" : "مدرب",
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                NetworkImage(widget.coachInfo.teamAvatar),
                            //     AssetImage(
                            //   "$assetImageBaseUrl${widget.coachInfo.teamAvatar}",
                            // ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.coachInfo.team,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            // backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(widget.coachInfo.countryAvatar),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.coachInfo.country,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ListTile(
                    //   horizontalTitleGap: 10,
                    //   leading: CircleAvatar(
                    //     radius: 60,
                    //     backgroundColor: Colors.white,
                    //     backgroundImage: AssetImage(
                    //       "$assetImageBaseUrl${widget.coachInfo.coachAvatar}",
                    //     ),
                    //   ),
                    //   title: Text(widget.coachInfo.coachName),
                    //   subtitle: Text(
                    //     context.locale == Locale('en') ? "Coach" : "مدرب",
                    //     style: TextStyle(color: primaryColor),
                    //   ),
                    // ),
                    // const SizedBox(height: 13),
                    //////////////////////////////////////////
                    // Row(
                    //   children: [
                    //     CircleAvatar(
                    //       radius: 20,
                    //       backgroundColor: Colors.white,
                    //       // backgroundImage: AssetImage(
                    //       //   "$assetImageBaseUrl${widget.coachInfo.coachAvatar}",
                    //       // ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       widget.clubName,
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 8),
                    // Row(
                    //   children: [
                    //     CircleAvatar(
                    //       radius: 20,
                    //       backgroundColor: Colors.white,
                    //       backgroundImage: AssetImage(
                    //         "$assetImageBaseUrl${widget.coachInfo.teamAvatar}",
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Text(
                    //       widget.country,
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 13),
                    TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: primaryColor,
                      indicatorColor: primaryColor,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          icon: Image(
                            image: AssetImage("${assetImageBaseUrl}form.png"),
                            width: 28,
                            color:
                                _activeIndex == 0 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Group 10261.png"),
                            width: 28,
                            color:
                                _activeIndex == 1 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage('${assetImageBaseUrl}trophy.png'),
                            width: 22,
                            color:
                                _activeIndex == 2 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image: AssetImage(
                                "${assetImageBaseUrl}Icon awesome-newspaper.png"),
                            width: 28,
                            color:
                                _activeIndex == 3 ? primaryColor : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Image(
                            image:
                                AssetImage("${assetImageBaseUrl}menu (1).png"),
                            width: 6,
                            color:
                                _activeIndex == 4 ? primaryColor : Colors.white,
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
                          CoachInfoTab(coachInfo: widget.coachInfo),
                          CoachTeamsTab(coachTeamsList: widget.coachInfo.teams),
                          CoachClubsTab(coachClubsList: widget.coachInfo.clubs),
                          CoachNewsTab(coachNews: widget.coachInfo.news),
                          //  CoachAudiansTab(coachAudiansList: widget.coachInfo.),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: lightBlackColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    auidanseWidegt(width, "Latest result :",
                                        widget.coachInfo.latestResult),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    auidanseWidegt(width, "Favorite Position :",
                                        widget.coachInfo.favoritePosition),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    auidanseWidegt(width, "Weekly Rating :",
                                        widget.coachInfo.weeklyRating),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width / 3.1,
                                            child: Text(
                                              "Audience vote :",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              widget.coachInfo.audienceVote,
                                              style: TextStyle(
                                                  color: Color(0x99FBFBFB)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                   //         child: new LinearPercentIndicator(width: width / 3, animation: true, lineHeight: 8.0, animationDuration: 2500, percent: widget.coachInfo.percentage, barRadius: Radius.circular(18.0), backgroundColor: Colors.grey, progressColor: primaryColor,),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
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

  Row auidanseWidegt(double width, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width / 3.1,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          width: width / 2,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: TextStyle(
                color: Color(0x99FBFBFB),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
