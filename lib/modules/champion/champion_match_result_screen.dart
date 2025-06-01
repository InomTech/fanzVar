import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/club_profile/club_profile_screen.dart';
import 'package:fanzhashem/modules/shared/gallery.dart' as g;
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../models/general_match_model.dart';
import '../club/club_profile.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChampionMatchResultScreen extends StatefulWidget {
  final match, championName, isFromGeneralMatches, generalMatch;

  const ChampionMatchResultScreen(
      {this.match,
      required this.championName,
      this.isFromGeneralMatches = false,
      this.generalMatch,
      super.key});

  @override
  State<ChampionMatchResultScreen> createState() =>
      _ChampionMatchResultScreenState();
}

class _ChampionMatchResultScreenState extends State<ChampionMatchResultScreen>
    with TickerProviderStateMixin {
  List<GeneralMatchModel> countryProfile = [];

  late TabController _tabController;
  int _activeIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    bool isEn = context.locale == Locale('en') ? true : false;
    return BlocProvider(
      create: (BuildContext context) =>
          ChampionCubit()..getCountryProfileData("2"),
      child: BlocConsumer<ChampionCubit, ChampionStates>(
        listener: (context, state) {
          if (state is GetCountryProfileDataState) {
            countryProfile = state.info;
            // navigateTo(
            //   context,
            //   ClubProfileScreen(
            //       info: state.info, isFirstTeam: state.isFirstTeam),
            // );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: darkBlackColor,
            resizeToAvoidBottomInset: false,
            appBar: appBar(
              scaffoldKey,
              widget.championName ??
                  LocaleKeys.general_matches_match_details.tr(),
              context,
              isMain: false,
              isHome: true,
              isEn: isEn,
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: 1500,
                child: Column(
                  children: [
                    Container(
                      height: height / 4.2,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            /// ========== First Team ===========
                            Container(
                              width: width / 3.4,
                              alignment: Alignment.center,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 12),
                                  InkWell(
                                    onTap: () {
                                      // getCountryProfileData(id)

                                      // if (match != null) {
                                      //   bool isFirstTeam;
                                      //   if (match.firstTeamId == id) {
                                      //     isFirstTeam = true;
                                      //   } else {
                                      //     isFirstTeam = false;
                                      //   }

                                      // }
                                      print(widget.generalMatch);
                                      if (widget.generalMatch == null) {
                                        var match = countryProfile.firstWhere(
                                          (GeneralMatchModel e) => (e.matchId ==
                                              widget.match["MatchID"]),
                                        );
                                        navigateTo(
                                            context,
                                            ClubProfileScreen(
                                                info: match,
                                                isCountry: true,
                                                isFirstTeam: true));
                                      } else {
                                        navigateTo(
                                            context,
                                            ClubProfileScreen(
                                                info: widget.generalMatch,
                                                isFirstTeam: true));
                                      }
                                      // navigateTo(
                                      //     context,
                                      //     ClubProfile(
                                      //       club: club1,
                                      //       clubLocation: "",
                                      //     ));
                                    },
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        widget.isFromGeneralMatches == true
                                            ? widget
                                                .generalMatch.firstTeamAvatar
                                            : widget.match["FTeamAvatar"],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.firstTeamName
                                        : widget.match["FTeamName"],
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  // SizedBox(height: 8),
                                  playerWidget(
                                      context.locale == Locale('en')
                                          ? "Ronaldo"
                                          : "رونالدو",
                                      "3'",
                                      width),
                                  playerWidget(
                                      context.locale == Locale('en')
                                          ? "Ronaldo"
                                          : "رونالدو",
                                      "1'",
                                      width),
                                  // playerWidget(
                                  //     context.locale == Locale('en')
                                  //         ? "Ronaldo"
                                  //         : "رونالدو",
                                  //     "8'",
                                  //     width),
                                ],
                              ),
                            ),

                            Container(
                              width: width / 2.5,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(height: 15),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget.generalMatch.league
                                              : widget.match["Name"],
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ]),
                                  SizedBox(height: 12),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          context.locale == Locale('en')
                                              ? "3 Apr 2021 10:30"
                                              : "3 أبريل 2021 10:30",
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ]),
                                  SizedBox(height: 12),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget
                                                  .generalMatch.firstTeamScore
                                              : "1",
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget
                                                  .generalMatch.secondTeamScore
                                              : "3",
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ]),
                                  SizedBox(height: 12),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          // "Match Ended",
                                          LocaleKeys.general_matches_match_ended
                                              .tr(),
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ]),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),

                            /// ========== Second Team ===========
                            Container(
                              width: width / 4,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(height: 12),
                                  InkWell(
                                    onTap: () {
                                      print(widget.generalMatch);
                                      print(widget.generalMatch);
                                      if (widget.generalMatch == null) {
                                        var match = countryProfile.firstWhere(
                                          (GeneralMatchModel e) => (e.matchId ==
                                              widget.match["MatchID"]),
                                        );
                                        navigateTo(
                                            context,
                                            ClubProfileScreen(
                                                info: match,
                                                isCountry: true,
                                                isFirstTeam: false));
                                      } else {
                                        navigateTo(
                                            context,
                                            ClubProfileScreen(
                                                info: widget.generalMatch,
                                                isFirstTeam: false));
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        widget.isFromGeneralMatches == true
                                            ? widget
                                                .generalMatch.secondTeamAvatar
                                            : widget.match["STeamAvatar"],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.secondTeamName
                                        : widget.match["STeamName"],
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    if (widget.isFromGeneralMatches == false)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height / 1.8,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: lightBlackColor,
                            border: Border.all(color: Color(0xFF424242)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                          widget.isFromGeneralMatches == true
                                              ? widget
                                                  .generalMatch.firstTeamAvatar
                                              : widget.match["FTeamAvatar"],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundImage: NetworkImage(
                                              widget.isFromGeneralMatches ==
                                                      true
                                                  ? widget
                                                      .generalMatch.leagueAvatar
                                                  : widget.match["Avatar"],
                                            ),
                                          ),
                                          // Image(
                                          //   image:
                                          //       AssetImage('${assetImageBaseUrl}9.png'),
                                          // ),
                                          SizedBox(height: 8),
                                          Text(LocaleKeys
                                              .general_matches_match_details
                                              .tr()),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                          widget.isFromGeneralMatches == true
                                              ? widget
                                                  .generalMatch.secondTeamAvatar
                                              : widget.match["STeamAvatar"],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),

                              /// ===============  Details =================
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.firstTeamScore
                                      : "57%",
                                  "Result",
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.secondTeamScore
                                      : "43%",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.firstTeamPossession
                                      : "57%",
                                  LocaleKeys.general_matches_possession.tr(),
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.secondTeamPossession
                                      : "43%",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.firstTeamShootsOn +
                                          "/" +
                                          widget.generalMatch.firstTeamTarget
                                      : "10/3",
                                  LocaleKeys.general_matches_shots.tr(),
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.secondTeamShootsOn +
                                          "/" +
                                          widget.generalMatch.secondTeamTarget
                                      : "6/2",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  "2[2]",
                                  LocaleKeys.general_matches_fouls.tr(),
                                  "5[1]",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  "4",
                                  LocaleKeys.general_matches_corner_kicks.tr(),
                                  "3",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  "3",
                                  LocaleKeys.general_matches_free_Kicks.tr(),
                                  "1",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget
                                          .generalMatch.firstTeamPassAccuracy
                                      : "67%",
                                  "Accuracy",
                                  widget.isFromGeneralMatches == true
                                      ? widget
                                          .generalMatch.secondTeamPassAccuracy
                                      : "86%",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget
                                          .generalMatch.firstTeamFansEvalution
                                      : "65%",
                                  "Fans Evalution",
                                  widget.isFromGeneralMatches == true
                                      ? widget
                                          .generalMatch.secondTeamFansEvalution
                                      : "45%",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch
                                          .firstTeamRefereePerformance
                                      : "90%",
                                  "Performance",
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch
                                          .secondTeamRefereePerformance
                                      : "95%",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  "16[1]",
                                  LocaleKeys.general_matches_passes_sucessfull
                                      .tr(),
                                  "10[5]",
                                  width),
                              // matchDetailsItem(
                              //     isFromGeneralMatches == true
                              //         ? generalMatch.firstTeamVotes
                              //         : "29000",
                              //     "Vote",
                              //     isFromGeneralMatches == true
                              //         ? generalMatch.secondTeamVotes
                              //         : "100000",
                              //     width),
                              const SizedBox(height: 7),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  "5",
                                  LocaleKeys.general_matches_crosses.tr(),
                                  "3",
                                  width),
                              const SizedBox(height: 7),
                              matchDetailsItem(
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.firstTeamSaves
                                      : "3",
                                  LocaleKeys.general_matches_saves.tr(),
                                  widget.isFromGeneralMatches == true
                                      ? widget.generalMatch.secondTeamSaves
                                      : "2",
                                  width),
                              const SizedBox(height: 4),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                        width: width / 10,
                                        child: Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget.generalMatch
                                                  .firstTeamYellowCard
                                              : "3",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      width: width / 2.5,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                  "${assetImageBaseUrl}Rectangle 5277.png")),
                                          Text(
                                            LocaleKeys.general_matches_cards
                                                .tr(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: width / 10,
                                        child: Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget.generalMatch
                                                  .secondTeamYellowCard
                                              : "5",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.right,
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 1),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: width / 10,
                                      child: Text(
                                        widget.isFromGeneralMatches == true
                                            ? widget
                                                .generalMatch.firstTeamRedCard
                                            : "0",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 2.5,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "${assetImageBaseUrl}Rectangle 5278.png",
                                            ),
                                          ),
                                          Text(
                                            LocaleKeys.general_matches_cards
                                                .tr(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 10,
                                      child: Text(
                                        widget.isFromGeneralMatches == true
                                            ? widget
                                                .generalMatch.secondTeamRedCard
                                            : "1",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    /// ================== Head to Head ==============

                    if (widget.isFromGeneralMatches == false)
                      headToHead(
                          widget.generalMatch, widget.match, width, height),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Yesterday")
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height / 1.8,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: lightBlackColor,
                              border: Border.all(color: Color(0xFF424242)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                            widget.isFromGeneralMatches == true
                                                ? widget.generalMatch
                                                    .firstTeamAvatar
                                                : widget.match["FTeamAvatar"],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              radius: 18,
                                              backgroundImage: NetworkImage(
                                                widget.isFromGeneralMatches ==
                                                        true
                                                    ? widget.generalMatch
                                                        .leagueAvatar
                                                    : widget.match["Avatar"],
                                              ),
                                            ),
                                            // Image(
                                            //   image:
                                            //       AssetImage('${assetImageBaseUrl}9.png'),
                                            // ),
                                            SizedBox(height: 8),
                                            Text(LocaleKeys
                                                .general_matches_match_details
                                                .tr()),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                            widget.isFromGeneralMatches == true
                                                ? widget.generalMatch
                                                    .secondTeamAvatar
                                                : widget.match["STeamAvatar"],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),

                                /// ===============  Details =================
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.firstTeamScore
                                        : "57%",
                                    "Result",
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.secondTeamScore
                                        : "43%",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget
                                            .generalMatch.firstTeamPossession
                                        : "57%",
                                    LocaleKeys.general_matches_possession.tr(),
                                    widget.isFromGeneralMatches == true
                                        ? widget
                                            .generalMatch.secondTeamPossession
                                        : "43%",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch
                                                .firstTeamShootsOn +
                                            "/" +
                                            widget.generalMatch.firstTeamTarget
                                        : "10/3",
                                    LocaleKeys.general_matches_shots.tr(),
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch
                                                .secondTeamShootsOn +
                                            "/" +
                                            widget.generalMatch.secondTeamTarget
                                        : "6/2",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    "2[2]",
                                    LocaleKeys.general_matches_fouls.tr(),
                                    "5[1]",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    "4",
                                    LocaleKeys.general_matches_corner_kicks
                                        .tr(),
                                    "3",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    "3",
                                    LocaleKeys.general_matches_free_Kicks.tr(),
                                    "1",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget
                                            .generalMatch.firstTeamPassAccuracy
                                        : "67%",
                                    "Accuracy",
                                    widget.isFromGeneralMatches == true
                                        ? widget
                                            .generalMatch.secondTeamPassAccuracy
                                        : "86%",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget
                                            .generalMatch.firstTeamFansEvalution
                                        : "65%",
                                    "FansEvalution",
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch
                                            .secondTeamFansEvalution
                                        : "45%",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch
                                            .firstTeamRefereePerformance
                                        : "90%",
                                    "Performance",
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch
                                            .secondTeamRefereePerformance
                                        : "95%",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    "16[1]",
                                    LocaleKeys.general_matches_passes_sucessfull
                                        .tr(),
                                    "10[5]",
                                    width),
                                // matchDetailsItem(
                                //     isFromGeneralMatches == true
                                //         ? generalMatch.firstTeamVotes
                                //         : "29000",
                                //     "Vote",
                                //     isFromGeneralMatches == true
                                //         ? generalMatch.secondTeamVotes
                                //         : "100000",
                                //     width),
                                const SizedBox(height: 7),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    "5",
                                    LocaleKeys.general_matches_crosses.tr(),
                                    "3",
                                    width),
                                const SizedBox(height: 7),
                                matchDetailsItem(
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.firstTeamSaves
                                        : "3",
                                    LocaleKeys.general_matches_saves.tr(),
                                    widget.isFromGeneralMatches == true
                                        ? widget.generalMatch.secondTeamSaves
                                        : "2",
                                    width),
                                const SizedBox(height: 4),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                          width: width / 10,
                                          child: Text(
                                            widget.isFromGeneralMatches == true
                                                ? widget.generalMatch
                                                    .firstTeamYellowCard
                                                : "3",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      SizedBox(
                                        width: width / 2.5,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    "${assetImageBaseUrl}Rectangle 5277.png")),
                                            Text(
                                              LocaleKeys.general_matches_cards
                                                  .tr(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width: width / 10,
                                          child: Text(
                                            widget.isFromGeneralMatches == true
                                                ? widget.generalMatch
                                                    .secondTeamYellowCard
                                                : "5",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.right,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: width / 10,
                                        child: Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget
                                                  .generalMatch.firstTeamRedCard
                                              : "0",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 2.5,
                                        // color: Colors.blue,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                "${assetImageBaseUrl}Rectangle 5278.png",
                                              ),
                                            ),
                                            Text(
                                              LocaleKeys.general_matches_cards
                                                  .tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 10,
                                        child: Text(
                                          widget.isFromGeneralMatches == true
                                              ? widget.generalMatch
                                                  .secondTeamRedCard
                                              : "1",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Yesterday")
                        headToHead(
                            widget.generalMatch, widget.match, width, height),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Today" ||
                          widget.generalMatch.date == "Tomorrow")
                        TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: primaryColor,
                          indicatorColor: primaryColor,
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(
                              icon: Image(
                                image:
                                    AssetImage("${assetImageBaseUrl}form.png"),
                                width: 28,
                                color: _activeIndex == 0
                                    ? primaryColor
                                    : Colors.white,
                              ),
                              // text: 'preview',
                            ),
                            Tab(
                              icon: Image(
                                image:
                                    AssetImage("${assetImageBaseUrl}Star.png"),
                                width: 28,
                                color: _activeIndex == 1
                                    ? primaryColor
                                    : Colors.white,
                              ),
                              // text: 'Expect',
                            ),
                            Tab(
                              icon: Image(
                                image: AssetImage(
                                    "${assetImageBaseUrl}Group 10259.png"),
                                width: 28,
                                color: _activeIndex == 2
                                    ? primaryColor
                                    : Colors.white,
                              ),
                              // text: 'Vote',
                            ),
                            Tab(
                              icon: Image(
                                image: AssetImage(
                                    "${assetImageBaseUrl}menu (1).png"),
                                width: 6,
                                color: _activeIndex == 3
                                    ? primaryColor
                                    : Colors.white,
                              ),
                              // text: 'News',
                            )
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Today" ||
                          widget.generalMatch.date == "Tomorrow")
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              matchToday(widget.generalMatch, height, width),
                              matchExpectation(
                                  widget.generalMatch, height, width),
                              matchstatistics(
                                  widget.generalMatch, height, width),
                              matchAbout(height),
                            ],
                          ),
                        ),

                    SizedBox(height: 5),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Today" ||
                          widget.generalMatch.date == "Tomorrow")
                        headToHead(
                            widget.generalMatch, widget.match, width, height),
                    if (widget.isFromGeneralMatches == true)
                      if (widget.generalMatch.date == "Yesterday")
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height / 5,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: lightBlackColor,
                              border: Border.all(color: Color(0xFF424242)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                if (widget.isFromGeneralMatches == true)
                                  if (widget.generalMatch.date == "Yesterday")
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // padding: const EdgeInsets.only(right: 20.0),
                                          width: width / 1.1,
                                          child: Center(
                                            child: Text(
                                              "Man of Match",
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
                                if (widget.isFromGeneralMatches == true)
                                  if (widget.generalMatch.date == "Yesterday")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    image: NetworkImage(widget
                                                                .isFromGeneralMatches ==
                                                            true
                                                        ? widget.generalMatch
                                                            .manOfMatchPicture
                                                        : "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png"),
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

                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 2.7,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          border: Border.all(color: Color(0xFF424242)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  // padding: const EdgeInsets.only(left: 10.0),
                                  width: width / 3,
                                  child: Text(
                                    "Gallery",
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
                                SizedBox(
                                  width: width / 3,
                                  child: GestureDetector(
                                    onTap: () {
                                      print(widget
                                          .generalMatch.gallery.runtimeType);

                                      navigateTo(
                                          context,
                                          g.Gallery(
                                              galleryImages:
                                                  widget.generalMatch.gallery));
                                    },
                                    child: Text(
                                      "All",
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            widget.isFromGeneralMatches == true
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        widget.generalMatch.gallery.length > 6
                                            ? widget.generalMatch.gallery
                                                .getRange(0, 6)
                                                .toList()
                                                .length
                                            : widget
                                                .generalMatch.gallery.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (BuildContext ctx, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FullScreenWidget(
                                            disposeLevel: DisposeLevel.Medium,
                                            child: Image(
                                              image: NetworkImage(
                                                widget.generalMatch
                                                        .gallery[index] ??
                                                    "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        widget.match["Gallery"].length > 6
                                            ? widget.match["Gallery"]
                                                .getRange(0, 6)
                                                .toList()
                                                .length
                                            : widget.match["Gallery"].length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (BuildContext ctx, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FullScreenWidget(
                                            disposeLevel: DisposeLevel.Medium,
                                            child: Image(
                                              image: NetworkImage(
                                                widget.match["Gallery"]
                                                        [index] ??
                                                    "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
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

  ///=============================================================================
  Widget playerWidget(String s1, String s2, width) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: width / 25,
            alignment: Alignment.center,
            child: Image(image: AssetImage("${assetImageBaseUrl}11.png"))),
        SizedBox(
          width: width / 5.5,
          child: Text(s1,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        Container(
          width: width / 20,
          alignment: Alignment.centerRight,
          child: Text(
            s2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFFECDBBB),
            ),
          ),
        ),
      ],
    );
  }

  ///=============================================================================
  Widget matchDetailsItem(String s1, String s2, String s3, width) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: width / 10,
            child: Text(
              s1,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: width / 2.5,
            child: Text(
              s2,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: width / 10,
            child: Text(s3,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }

  Widget matchToday(
    generalMatch,
    height,
    width,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height / 1.8,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.firstTeamAvatar
                            : widget.match["FTeamAvatar"],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            widget.isFromGeneralMatches == true
                                ? generalMatch.leagueAvatar
                                : widget.match["Avatar"],
                          ),
                        ),
                        // Image(
                        //   image:
                        //       AssetImage('${assetImageBaseUrl}9.png'),
                        // ),
                        SizedBox(height: 8),
                        Text("Match Preview "),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.secondTeamAvatar
                            : widget.match["STeamAvatar"],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// ===============  Details =================
            ///  matchDetailsItemToday(
            matchDetailsItemToday(
                generalMatch.firstTeamName,
                widget.isFromGeneralMatches == true
                    ? generalMatch.teamMatches + " matches"
                    : "1" "matches",
                generalMatch.secondTeamName,
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday("Win", "Drawn", "Win", width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamWin
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.teamsDrawn
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamWin
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamCoach
                    : "",
                "Coaches",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamCoach
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamWLD
                    : "",
                "W/L/D",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamWLD
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamGoalScorrersName
                    : "",
                "Goal scorres",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamGoalScorrersName
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamGoalScorrers
                    : "",
                "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamGoalScorrers
                    : "",
                width),
            const SizedBox(height: 7),

            matchDetailsItem("", "Expectation", "", width),
            const SizedBox(height: 7),
            matchDetailsItemToday("Win", "Drawn", "Win", width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamExpectationWin
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.teamExpectationDrawn
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamGoalExpectationWin
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItem("", "Votes", "", width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamFansNumber
                    : "1000",
                "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamFansNumber
                    : "2000",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamRank
                    : "",
                "Rank",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamRank
                    : "",
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamFansAttendance
                    : "",
                "Fans attendance",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamFansAttendance
                    : "",
                width),
          ],
        ),
      ),
    );
  }

  Widget matchstatistics(
    generalMatch,
    height,
    width,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height / 1.8,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.firstTeamAvatar
                            : widget.match["FTeamAvatar"],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            widget.isFromGeneralMatches == true
                                ? generalMatch.leagueAvatar
                                : widget.match["Avatar"],
                          ),
                        ),
                        // Image(
                        //   image:
                        //       AssetImage('${assetImageBaseUrl}9.png'),
                        // ),
                        SizedBox(height: 8),
                        Text("Statistics"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.secondTeamAvatar
                            : widget.match["STeamAvatar"],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// ===============  Details =================
            ///  matchDetailsItemToday(

            const SizedBox(height: 15),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true ? '5' : "3",
                "Win",
                widget.isFromGeneralMatches == true ? '1' : "2",
                width),
            const SizedBox(height: 15),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true ? '1' : "3",
                "Drawn",
                widget.isFromGeneralMatches == true ? '1' : "2",
                width),
            const SizedBox(height: 15),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true ? '1' : "3",
                "defeat",
                widget.isFromGeneralMatches == true ? '5' : "2",
                width),
            const SizedBox(height: 15),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true ? '15' : "3",
                "Goals",
                widget.isFromGeneralMatches == true ? '8' : "2",
                width),
            const SizedBox(height: 15),
            Divider(
              thickness: 1,
              color: Colors.white,
              height: 1,
            ),
            const SizedBox(height: 15),

            matchDetailsItemToday('Premier league', "", '3 Apr 2022', width),
            const SizedBox(height: 15),
            matchDetailsItemStatic(generalMatch.firstTeamName, "2-2",
                generalMatch.secondTeamName, width),
            const SizedBox(height: 15),
            Divider(
              thickness: 1,
              color: Colors.white,
              height: 1,
            ),
            const SizedBox(height: 15),

            matchDetailsItemToday('Premier league', "", '3 March 2022', width),
            const SizedBox(height: 15),
            matchDetailsItemStatic(generalMatch.firstTeamName, "3-6",
                generalMatch.secondTeamName, width),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget matchAbout(height) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlackColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'About',
              valueStr:
                  "Since the second World Cup in 1934, qualifying tournaments have been held to thin the field for the final tournament. [64] They are held within the six FIFA continental zones (Africa, Asia, North and Central America and Caribbean, South America, Oceania, and Europe), overseen by their respective confederations. For each tournament, FIFA decides the number of places awarded to each of the continental zones beforehand, generally based on the relative strength of the confederations teams.",
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'About',
              valueStr:
                  "Since the second World Cup in 1934, qualifying tournaments have been held to thin the field for the final tournament. [64] They are held within the six FIFA continental zones (Africa, Asia, North and Central America and Caribbean, South America, Oceania, and Europe), overseen by their respective confederations. For each tournament, FIFA decides the number of places awarded to each of the continental zones beforehand, generally based on the relative strength of the confederations teams.",
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }

  int number = 0;
  Widget matchExpectation(
    generalMatch,
    height,
    width,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height / 1.8,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.firstTeamAvatar
                            : widget.match["FTeamAvatar"],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            widget.isFromGeneralMatches == true
                                ? generalMatch.leagueAvatar
                                : widget.match["Avatar"],
                          ),
                        ),
                        // Image(
                        //   image:
                        //       AssetImage('${assetImageBaseUrl}9.png'),
                        // ),
                        SizedBox(height: 8),
                        Text("Match Expectation "),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        widget.isFromGeneralMatches == true
                            ? generalMatch.secondTeamAvatar
                            : widget.match["STeamAvatar"],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// ===============  Details =================
            ///  matchDetailsItemToday(
            matchDetailsItemToday(
                generalMatch.firstTeamName,
                widget.isFromGeneralMatches == true
                    ? generalMatch.teamMatches + " matches"
                    : "1" "matches",
                generalMatch.secondTeamName,
                width),
            const SizedBox(height: 7),
            matchDetailsItemToday("Win", "Drawn", "Win", width),
            const SizedBox(height: 7),
            matchDetailsItemToday(
                widget.isFromGeneralMatches == true
                    ? generalMatch.firstTeamWin
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.teamsDrawn
                    : "",
                widget.isFromGeneralMatches == true
                    ? generalMatch.secondTeamWin
                    : "",
                width),
            const SizedBox(height: 30),

            matchDetailsItemToday("", "Who is the winning team?", "", width),

            const SizedBox(height: 15),

            matchDetailsItemExpectation(generalMatch.firstTeamName, "Drawn",
                generalMatch.secondTeamName, width, false, true, false),
            const SizedBox(height: 30),
            matchDetailsItemToday("", "Predict goal difference", "", width),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (() {
                      // add!();
                      setState(() {
                        number += 1;
                      });
                    }),
                    child: Container(
                      width: 29,
                      height: 29,
                      decoration: BoxDecoration(
                        color: Color(0xFF2E2E2E),
                        border: Border.all(color: Color(0xFF707070)),
                        // borderRadius:
                        //     BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(color: Color(0xFFCDA250)),
                      )),
                    )),
                Container(
                  width: 50,
                  height: 29,
                  decoration: BoxDecoration(
                    color: Color(0xFF2E2E2E),
                    border: Border.all(color: Color(0xFF707070)),
                    // borderRadius:
                    //     BorderRadius.circular(50),
                  ),
                  child: Center(child: Text(number.toString())),
                ),
                InkWell(
                    onTap: (() {
                      // remove!();
                      setState(() {
                        if (number != 0) {
                          number -= 1;
                        }
                      });
                    }),
                    child: Container(
                        width: 29,
                        height: 29,
                        decoration: BoxDecoration(
                          color: Color(0xFF2E2E2E),
                          border: Border.all(color: Color(0xFF707070)),
                          // borderRadius:
                          //     BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text("-",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFFCDA250)))))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final cubbbitt = ChampionCubit();

  Widget matchDetailsItemExpectation(
      String s1, String s2, String s3, width, choose1, choose2, choose3) {
    return BlocProvider(
        create: (BuildContext context) => cubbbitt,
        child: BlocConsumer<ChampionCubit, ChampionStates>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: (width / 3) - 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        color: cubbbitt.choose1 == true
                            ? darkBlackColor
                            : lightBlackColor,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: lightBlackColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            context.read<ChampionCubit>().choose2 = false;
                            context.read<ChampionCubit>().choose3 = false;
                            context.read<ChampionCubit>().choose1 = true;
                          });
                        },
                        child: Text(s1),
                      ),
                    ),
                    Container(
                      // width: width / 5,
                      width: (width / 3) - 15,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        color: cubbbitt.choose2 == true
                            ? darkBlackColor
                            : lightBlackColor,
                        border: Border.all(
                          color: Colors.white,
                          // color: creatCubit.selectStateError
                          //     ? Colors.red
                          //     : lightBlackColor),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: lightBlackColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            context.read<ChampionCubit>().choose1 = false;
                            context.read<ChampionCubit>().choose3 = false;
                            context.read<ChampionCubit>().choose2 = true;
                          });
                        },
                        child: Text(s2),
                      ),
                    ),
                    Container(
                      width: (width / 3) - 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        color: cubbbitt.choose3 == true
                            ? darkBlackColor
                            : lightBlackColor,
                        border: Border.all(
                          color: Colors.white,
                          // color: creatCubit.selectStateError
                          //     ? Colors.red
                          //     : lightBlackColor),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: lightBlackColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            context.read<ChampionCubit>().choose1 = false;
                            context.read<ChampionCubit>().choose2 = false;
                            context.read<ChampionCubit>().choose3 = true;
                          });
                        },
                        child: Text(s3),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  Widget matchDetailsItemToday(String s1, String s2, String s3, width) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            // width: width / 2.5,
            child: Text(
              s1,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            // width: width / 5,
            child: Text(
              s2,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            // width: width / 2.5,
            child: Text(s3,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }

  Widget matchDetailsItemStatic(String s1, String s2, String s3, width) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // width: width / 2.5,
              child: Text(
                s1,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              // width: width / 5,
              child: Text(
                s2,
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // width: width / 2.5,
              child: Text(
                s3,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headToHead(generalMatch, match, width, height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height / 4.2,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            /// ================== Head to Head ==============

            SizedBox(height: 15),
            Center(
              child: Text(
                // "Head to Head",
                LocaleKeys.general_matches_head_to_head.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    widget.isFromGeneralMatches == true
                        ? widget.generalMatch.firstTeamAvatar
                        : widget.match["FTeamAvatar"],
                  ),
                ),
                SizedBox(
                  width: width / 2.8,
                  // color: Colors.red,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('4'),
                            Text(LocaleKeys.general_matches_wins.tr()),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('1'),
                            Text(LocaleKeys.general_matches_draw.tr()),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('2'),
                            Text("Lose"
                                // LocaleKeys.general_matches_wins.tr()
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    widget.isFromGeneralMatches == true
                        ? widget.generalMatch.secondTeamAvatar
                        : widget.match["STeamAvatar"],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // ====================
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Games : 5 times",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Coaches : 3 times",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
