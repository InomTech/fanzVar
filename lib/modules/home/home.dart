import 'dart:developer';
import 'dart:convert';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/modules/home/cubit/cubit.dart';
import 'package:fanzhashem/modules/home/cubit/states.dart';

import 'package:fanzhashem/modules/home/home_widgets.dart';
import 'package:fanzhashem/modules/latest_news/latest_news.dart';
import 'package:fanzhashem/modules/scores/matches_schedule.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;  // تأكد من استيراد http
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../utilities/constants.dart' as currentUser;
import '../../widgets/buttons_widget.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    initTargets();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted && targets.isEmpty) {
      showTutorial();
    }
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      skipWidget:
      //  Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      TxtButton(
        // txtSize: 50,
        color: primaryColor,
        // borderColor: lightBlackColor,
        txtColor: Colors.black,
        borderColor: Colors.white,
        text: "Skip",
        borderRadius: 10,
        // horizontalPadding: 10,
        verticalPadding: 10,
        onPressed: () {  tutorialCoachMark.finish();},
      ),
      // TxtButton(
      //   // txtSize: 50,
      //   color: primaryColor,
      //   // borderColor: lightBlackColor,
      //   txtColor: Colors.black,
      //   borderColor: Colors.white,
      //   text: "dont show",
      //   borderRadius: 10,
      //   // horizontalPadding: 10,
      //   verticalPadding: 10,
      //   onPressed: () {
      //     tutorialCoachMark.finish();
      //   },
      // ),
      //   ],
      // ),
      textStyleSkip:
      TextStyle(fontSize: 20, backgroundColor: primaryColor, height: 1),
      // textSkip: ' Skip ',
      alignSkip: Alignment.topRight,
      targets: targets,
      colorShadow: Colors.transparent,
      paddingFocus: 1,
      focusAnimationDuration: Duration(milliseconds: 500),
      pulseAnimationDuration: Duration(milliseconds: 500),
      opacityShadow: .5,
      onFinish: () {
        print("finish");
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        log("target: $target");
        log("clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickTarget: (target) {
        log("target: $target");
      },
      onClickOverlay: (target) {
        log('onClickOverlay: $target');
      },
      onSkip: () {
        log("skip");
        return true; // إرجاع قيمة بوليانية لتجنب المشكلة
      },
    )..show(context: context);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<GeneralMatchModel> generalMatches = [];
  List<GeneralMatchModel> todayMatches = [];
  List<GeneralMatchModel> yesterdayMatches = [];
  List<GeneralMatchModel> tomorrowMatches = [];
  late TutorialCoachMark tutorialCoachMark;
// ignore: deprecated_member_use
  List<TargetFocus> targets = [];

  GlobalKey key = GlobalKey();
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  List sponsors = [];
  String homeSponsors = "home";
  initTargets() {
    targets.add(
      TargetFocus(
        shape: ShapeLightFocus.RRect,
        // shape: ShapeLightFocus.Circle,
        alignSkip: Alignment.topRight,
        identify: "Target 0",
        keyTarget: key,
        enableOverlayTab: false,
        enableTargetTab: false,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          '${assetImageBaseUrl}bg2.png',
                          fit: BoxFit.contain,
                          // color: title.toString().contains("Other") ? Colors.white : null,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Footbool Champions League ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      Text(
                        "Each team consists of 11 players. These are made up of one goalkeeper and ten outfield players",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 200),
                      TxtButton(
                        // txtSize: 18,
                        color: primaryColor,
                        txtColor: Colors.black,
                        borderColor: Colors.white,
                        text: "Next",
                        borderRadius: 10,
                        horizontalPadding: 150,
                        verticalPadding: 15,
                        onPressed: () {
                          tutorialCoachMark.next();
                        },
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: _key1,
        enableOverlayTab: false,
        enableTargetTab: false,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          '${assetImageBaseUrl}bg0.png',
                          fit: BoxFit.contain,
                          // color: title.toString().contains("Other") ? Colors.white : null,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        "Playstation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Each team consists of one  players. These are made up of one goalkeeper and ten outfield players",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      TxtButton(
                        // txtSize: 18,
                        color: primaryColor,
                        txtColor: Colors.black,
                        borderColor: Colors.white,
                        text: "Next",
                        borderRadius: 10,
                        horizontalPadding: 150,
                        verticalPadding: 15,
                        onPressed: () {
                          tutorialCoachMark.next();
                        },
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: _key2,
        enableOverlayTab: false,
        enableTargetTab: false,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          '${assetImageBaseUrl}bg1.png',
                          fit: BoxFit.contain,
                          // color: title.toString().contains("Other") ? Colors.white : null,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        "Other Sports",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Each team consists of 11 players. These are made up of one goalkeeper and ten outfield players",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      TxtButton(
                        // txtSize: 18,
                        color: primaryColor,
                        txtColor: Colors.black,
                        borderColor: Colors.white,
                        text: "Next",
                        borderRadius: 10,
                        horizontalPadding: 150,
                        verticalPadding: 15,
                        onPressed: () {
                          tutorialCoachMark.next();
                        },
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isEnglish = context.locale == Locale('en') ? true : false;
    return new BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()
        ..initializeCurrentUser()
        ..getLatestNews()
        ..getSponsors(this.homeSponsors)
        ..getGeneralMatches(isEnglish),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) async {
          if (state is InitializeCurrentUser) {
            showToast(msg: 'Welcome ${currentUser.name}');
          }
          if (state is GetGeneralMatchesState) {
            generalMatches = state.matches;
            todayMatches = state.todayMatches;
            yesterdayMatches = state.yesterdayMatches;
            tomorrowMatches = state.tomorrowMatches;
          }
          if (state is GetSponsorsState) {
            sponsors = state.sponsors[0];
          }
        },
        builder: (context, state) => WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: SafeArea(
            child: new Scaffold(
              key: _scaffoldKey,
               backgroundColor: Colors.black,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: [
                    ///Sponsers
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Colors.amber,

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
                            for (var i = 0; i < sponsors.length; i++)
                              imageCircle(sponsors[i], i == 0 ? key : null),
                            // imageCircle("puma.png"),
                            // imageCircle("saib.png"),
                            // imageCircle("on.png"),
                            // imageCircle("puma.png"),
                            // imageCircle("saib.png"),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints.expand(
                              height: 200,
                            ),
                            child: imageSlider(context, key, _key1, _key2),
                          ),

                          /// Latest News

                          subTitle(
                            LocaleKeys.home_screen_latest_news.tr(),
                            context,
                            LatestNews(
                              latestNews: BlocProvider.of<HomeCubit>(context)
                                  .latestNews,
                            ),
                          ),

                          BlocProvider.of<HomeCubit>(context)
                              .latestNews
                              .isNotEmpty
                              ? Container(
                              constraints: BoxConstraints.expand(
                                height: 180,
                              ),
                              child: SizedBox(
                                //  key: _key1,
                                  child: latestNewsSwiper(
                                      context,
                                      BlocProvider.of<HomeCubit>(context)
                                          .latestNews)))
                              : ShowLoading(),

                          /// =========== Matches ===============
                          subTitle(
                            LocaleKeys.home_screen_matches.tr(),
                            context,
                            MatchesScheduleScreen(
                              generalMatches: generalMatches,
                              todayMatches: todayMatches,
                              yesterdayMatches: yesterdayMatches,
                              tomorrowMatches: tomorrowMatches,
                            ),
                          ),
                          generalMatches.isNotEmpty
                              ? Container(
                            constraints: BoxConstraints.expand(
                              height: 180,
                            ),
                            child: SizedBox(
                              //  key: _key2,
                              child: matchesSwiper(
                                context,
                                generalMatches,
                              ),
                            ),
                          )
                              : ShowLoading(),
// subTitle(
//                             "Scores",
//                             context,
//                           Scores(
//                             scores:
//                                 BlocProvider.of<HomeCubit>(context).scores,
//                           ),

                          // BlocProvider.of<HomeCubit>(context).scores.isNotEmpty
                          //     ? Container(
                          //         constraints: BoxConstraints.expand(
                          //           height: 180,
                          //         ),
                          //         child: scoresSwiper(
                          //             context,
                          //             BlocProvider.of<HomeCubit>(context)
                          //                 .scores))
                          //     : ShowLoading(),

                          SizedBox(
                            height: height / 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
