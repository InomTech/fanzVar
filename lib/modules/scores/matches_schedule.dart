import 'dart:developer';

import "package:collection/collection.dart";
import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/modules/champion/champion_match_result_screen.dart';
import 'package:fanzhashem/modules/tickets/tickets_details.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/buttons_widget.dart';
import '../../widgets/dropdown_menu_widget.dart';
import '../../widgets/fields_widget.dart';
import '../champion/champion_overview_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MatchesScheduleScreen extends StatefulWidget {
  final List<GeneralMatchModel> generalMatches,
      todayMatches,
      yesterdayMatches,
      tomorrowMatches;
  const MatchesScheduleScreen(
      {required this.generalMatches,
      required this.todayMatches,
      required this.yesterdayMatches,
      required this.tomorrowMatches,
      super.key});

  @override
  State<MatchesScheduleScreen> createState() => _MatchesScheduleScreenState();
}

var tomorrow, yesterday, today;

class _MatchesScheduleScreenState extends State<MatchesScheduleScreen> {
  int selectedIndex = 1; //0 ==>Yesterday  OR 1==>Today OR 2 ==>Tomorrow
  late List<GeneralMatchModel> activeMatchesList;
  late Map<String, List<GeneralMatchModel>> mapPerLeague;
  late var selectedDate;
  String? selectedValueChampoin;
  List championList = [];

  @override
  initState() {
    activeMatchesList = widget.todayMatches;

    mapPerLeague =
        groupBy(activeMatchesList, (GeneralMatchModel obj) => obj.league);
    selectedDate = DateTime.now();
    // DateFormat.yMMMEd('en_US').format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    tomorrow =
        DateFormat.yMMMMd(context.locale == Locale('en') ? 'en_US' : "ar")
            .format(DateTime.now().add(Duration(days: 1)));
    yesterday =
        DateFormat.yMMMMd(context.locale == Locale('en') ? 'en_US' : "ar")
            .format(DateTime.now().subtract(Duration(days: 1)));
    today = DateFormat.yMMMMd(context.locale == Locale('en') ? 'en_US' : "ar")
        .format(DateTime.now());
    return BlocProvider<ScoresCubit>(
      create: (context) => ScoresCubit()..getChampion(),
      child: BlocConsumer<ScoresCubit, ScoresStates>(
          listener: (context, state) async {
        if (state is SelectValueChampoinLeague) {
          print(BlocProvider.of<ScoresCubit>(context)
              .selectedValueChampoinLeague);
          selectedValueChampoin =
              BlocProvider.of<ScoresCubit>(context).selectedValueChampoinLeague;
        }
        if (state is ApplyFilterSuccess) {
          Navigator.pop(context);
          showToast(msg: "Filter applied successfully");
        }
        if (state is GetScoresState) {
          championList = state.championList;
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: darkBlackColor,
          resizeToAvoidBottomInset: false,
          appBar: appBar(
              scaffoldKey,
              // "Matches Schedule",
              LocaleKeys.general_matches_matches_schedule.tr(),
              context,
              isMain: false,
              isHome: true,
              isEn: context.locale == Locale('en') ? true : false,
              isShowFilter: true, filterFunc: () {
            BlocProvider.of<ScoresCubit>(context).fromDateController.clear();
            BlocProvider.of<ScoresCubit>(context).toDateController.clear();

            // showFilterCompetitionAlertDialog(
            //     context, BlocProvider.of<ScoresCubit>(context));
            final cubit = BlocProvider.of<ScoresCubit>(context);
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (ctx) =>
                  StatefulBuilder(builder: (context, StateSetter setState) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  title: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      height: 60,
                      color: primaryColor,
                      // clipBehavior: Clip.,
                      // color: genieTheme.accentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.competitions_screen_filter.tr(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            // style: black20.copyWith(
                            //   color: genieTheme.accentColor,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  titlePadding: const EdgeInsets.all(0),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.6,
                    child: Form(
                      key: cubit.filterFormKey,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 15.0, right: 20, left: 20),
                            child: TxtField(
                              controller: cubit.fromDateController,
                              hintText:
                                  LocaleKeys.competitions_screen_from_date.tr(),
                              validator: (value) {
                                if (value.toString().isEmpty || value == null) {
                                  return LocaleKeys
                                      .competitions_screen_from_date
                                      .tr();
                                }
                              },
                              prefixIcon: Icons.date_range,
                              isReadOnly: true,
                              onTap: () async {
                                DateTime? datePick = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                print(datePick);

                                cubit.addDate(datePick);
                              },
                              colorPrefixIcon: primaryColor,
                              keyboardType: TextInputType.text,
                              onChanged: (String str) {},
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 24.0, right: 20, left: 20),
                            child: TxtField(
                              controller: cubit.toDateController,
                              hintText:
                                  LocaleKeys.competitions_screen_to_date.tr(),
                              validator: (value) {
                                if (value.toString().isEmpty || value == null) {
                                  return LocaleKeys
                                      .competitions_screen_to_date_msg
                                      .tr();
                                }
                              },
                              prefixIcon: Icons.date_range,
                              isReadOnly: true,
                              onTap: () async {
                                DateTime? datePick = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                print(datePick);

                                cubit.addDate(datePick, isFrom: false);
                              },
                              colorPrefixIcon: primaryColor,
                              keyboardType: TextInputType.text,
                              onChanged: (String str) {},
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 23.0, right: 20, left: 20),
                              // padding:
                              //     EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              //   color: lightBlackColor,
                              //   // border: Border.all(
                              //   //     color: BlocProvider.of<
                              //   //                     CreateTeamCubit>(
                              //   //                 context)
                              //   //             .selectedPlayerError
                              //   //         ? Colors.red
                              //   //         : lightBlackColor),
                              // ),
                              child: DropDownMenuWidget(
                                isMatchSchdual: true,
                                hint: 'Choose Champion',
                                items: cubit.Champions,
                                selectedValue: selectedValueChampoin,
                                onChanged: (val) {
                                  cubit.selectValueChampoinLeague(
                                      val.toString());
                                  log("${cubit.selectedValueChampoinLeague}");
                                  setState(() {
                                    selectedValueChampoin = val;
                                  });
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TxtButton(
                          color: primaryColor,
                          text: LocaleKeys.competitions_screen_apply.tr(),
                          borderRadius: 10,
                          horizontalPadding: 35,
                          verticalPadding: 10,
                          onPressed: () {
                            cubit.applyFilter();
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: height / 10,
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData(
                                    primarySwatch: Colors.grey,
                                    splashColor: Colors.grey,
                                    // textTheme: TextTheme(
                                    //   subtitle1: TextStyle(color: Colors.grey),
                                    //   button: TextStyle(color: Colors.grey),
                                    // ),
                                    hintColor: Colors.black,
                                    colorScheme: ColorScheme.light(
                                        primary: primaryColor,
                                        onSecondary: Colors.grey,
                                        onPrimary: Colors.white,
                                        surface: Colors.grey,
                                        onSurface: Colors.grey,
                                        secondary: Colors.grey),
                                    dialogTheme: DialogThemeData(
                                        backgroundColor: lightBlackColor),
                                  ),
                                  child: child ?? Text(""),
                                );
                              },
                              initialDate: //DateTime.now(),
                                  selectedDate,
                              firstDate: DateTime(1990),
                              lastDate: DateTime(21022),
                            );
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: SizedBox(
                            width: width / 2,
                            child: Text(
                              // "Sunday 31/02/2022", yMMMEd  yMMMMEEEEd
                              DateFormat.yMMMEd(context.locale == Locale('en')
                                      ? 'en_US'
                                      : "ar")
                                  .format(selectedDate)
                                  .toString(),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width / 2.4,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "4 matches",
                                LocaleKeys.general_matches_matches
                                    .tr(args: ["4"]),
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // "2 competions",
                                LocaleKeys.general_matches_competitions
                                    .tr(args: ["2"]),
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height / 40),

                /// =============== Yesterday - Today - Tomorrow Section =============
                SizedBox(
                  height: height / 15,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      late String txt;
                      if (index == 0) {
                        txt = LocaleKeys.general_matches_yesterday.tr();
                      }
                      if (index == 1) {
                        txt = LocaleKeys.general_matches_today.tr();
                      }
                      if (index == 2) {
                        txt = LocaleKeys.general_matches_tomorrow.tr();
                      }
                      return Padding(
                        padding: index == 2
                            ? context.locale == Locale('en')
                                ? const EdgeInsets.only(right: 0.0)
                                : const EdgeInsets.only(right: 5.0)
                            : const EdgeInsets.only(right: 5.0),
                        child: categoryItem(
                          txt: txt,
                          width: width,
                          height: height,
                          txtColor: isSelected ? Colors.white : Colors.black,
                          bgColor: isSelected ? primaryColor : Colors.white,
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                              if (index == 0) {
                                activeMatchesList = widget.yesterdayMatches;
                              }

                              if (index == 1) {
                                activeMatchesList = widget.todayMatches;
                              }

                              if (index == 2) {
                                activeMatchesList = widget.tomorrowMatches;
                              }

                              mapPerLeague = groupBy(activeMatchesList,
                                  (GeneralMatchModel obj) => obj.league);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height / 40),

                ///===================== Match List per section ======================
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: mapPerLeague.length,
                  itemBuilder: (BuildContext context, int index) {
                    String league = mapPerLeague.keys.elementAt(index);
                    var matchesList = mapPerLeague.values.elementAt(index);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                matchesList[0].leagueAvatar,
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                //Premier League Premier League
                                // print(
                                //     championList[2]["ChampionList"][0]['Name']);
                                if (league == 'Premier League' ||
                                    league == "UAE Pro League") {
                                  navigateTo(
                                    context,
                                    ChampionOverviewScreen(
                                      champion: championList[2],
                                      championDetails: championList[2]
                                          ["ChampionList"][0],
                                    ),
                                  );
                                } else if (league == "CAF Champions League " ||
                                    league == "CAF Champions League" ||
                                    league == "Egyptian Premier League") {
                                  navigateTo(
                                    context,
                                    ChampionOverviewScreen(
                                      champion: championList[1],
                                      championDetails: championList[1]
                                          ["ChampionList"][0],
                                    ),
                                  );
                                } else if (league == "La Liga" ||
                                    league == "Ligue 1" ||
                                    league == "Pro League" ||
                                    league == "Saudi Professional League" ||
                                    league == "Bundesliga") {
                                  navigateTo(
                                    context,
                                    ChampionOverviewScreen(
                                      champion: championList[0],
                                      championDetails: championList[1]
                                          ["ChampionList"][0],
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                league,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: matchesList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext ctx, int i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: matchItem(
                                match: matchesList[i],
                                width: width,
                                height: height,
                                selectedTabIndex: selectedIndex,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ))
                // Expanded(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: activeMatchesList.length,
                //     physics: BouncingScrollPhysics(),
                //     itemBuilder: (BuildContext ctx, int index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: matchItem(
                //           match: activeMatchesList[index],
                //           width: width,
                //           height: height,
                //           selectedTabIndex: selectedIndex,
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        );
      }),
    );
  }

  showJoinTeamAlertDialog(context, competition, Function updateIsJoined) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          title: Icon(
            Icons.sports_football,
            color: Colors.white,
            size: 40,
          ),
          content: SizedBox(
            height: 80,
            child: Column(
              children: [
                Text(
                  "${competition.teamName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${competition.seats}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TxtButton(
                  color: primaryColor,
                  text: LocaleKeys.competitions_screen_join_team.tr(),
                  borderRadius: 10,
                  horizontalPadding: 35,
                  verticalPadding: 10,
                  onPressed: () {
                    updateIsJoined();
                    showToast(
                        msg: LocaleKeys.competitions_screen_join_team_msg.tr());
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      );

  /// filter competition Alert

  // showFilterCompetitionAlertDialog(context, cubit) => showDialog(
  //       barrierDismissible: true,
  //       context: context,
  //       builder: (ctx) => AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  //         title: ClipRRect(
  //           clipBehavior: Clip.antiAlias,
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //           child: Container(
  //             height: 60,
  //             color: primaryColor,
  //             // clipBehavior: Clip.,
  //             // color: genieTheme.accentColor,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   LocaleKeys.competitions_screen_filter.tr(),
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 2,
  //                   softWrap: false,
  //                   style: TextStyle(
  //                       fontSize: 16,
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.w600),
  //                   // style: black20.copyWith(
  //                   //   color: genieTheme.accentColor,
  //                   // ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         titlePadding: const EdgeInsets.all(0),
  //         content: Container(
  //           height: MediaQuery.of(context).size.height / 3,
  //           child: Form(
  //             key: cubit.filterFormKey,
  //             child: Column(
  //               children: [
  //                 Container(
  //                   margin: EdgeInsets.only(top: 25.0, right: 20, left: 20),
  //                   child: TxtField(
  //                     controller: cubit.fromDateController,
  //                     hintText: LocaleKeys.competitions_screen_from_date.tr(),
  //                     validator: (value) {
  //                       if (value.toString().isEmpty || value == null) {
  //                         return LocaleKeys.competitions_screen_from_date.tr();
  //                       }
  //                     },
  //                     prefixIcon: Icons.date_range,
  //                     isReadOnly: true,
  //                     onTap: () async {
  //                       DateTime? datePick = await showDatePicker(
  //                         context: context,
  //                         initialDate: DateTime.now(),
  //                         firstDate: DateTime(1900),
  //                         lastDate: DateTime(2050),
  //                       );

  //                       print(datePick);

  //                       cubit.addDate(datePick);
  //                     },
  //                     colorPrefixIcon: primaryColor,
  //                     keyboardType: TextInputType.text,
  //                     onChanged: (String str) {},
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.only(top: 25.0, right: 20, left: 20),
  //                   child: TxtField(
  //                     controller: cubit.toDateController,
  //                     hintText: LocaleKeys.competitions_screen_to_date.tr(),
  //                     validator: (value) {
  //                       if (value.toString().isEmpty || value == null) {
  //                         return LocaleKeys.competitions_screen_to_date_msg
  //                             .tr();
  //                       }
  //                     },
  //                     prefixIcon: Icons.date_range,
  //                     isReadOnly: true,
  //                     onTap: () async {
  //                       DateTime? datePick = await showDatePicker(
  //                         context: context,
  //                         initialDate: DateTime.now(),
  //                         firstDate: DateTime(1900),
  //                         lastDate: DateTime(2050),
  //                       );

  //                       print(datePick);

  //                       cubit.addDate(datePick, isFrom: false);
  //                     },
  //                     colorPrefixIcon: primaryColor,
  //                     keyboardType: TextInputType.text,
  //                     onChanged: (String str) {},
  //                   ),
  //                 ),
  //                 Container(
  //                     margin: EdgeInsets.only(top: 15.0, right: 20, left: 20),
  //                     // padding:
  //                     //     EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
  //                     // decoration: BoxDecoration(
  //                     //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
  //                     //   color: lightBlackColor,
  //                     //   // border: Border.all(
  //                     //   //     color: BlocProvider.of<
  //                     //   //                     CreateTeamCubit>(
  //                     //   //                 context)
  //                     //   //             .selectedPlayerError
  //                     //   //         ? Colors.red
  //                     //   //         : lightBlackColor),
  //                     // ),
  //                     child: DropDownMenuWidget(
  //                       hint: 'Choose Champion',
  //                       items: BlocProvider.of<ScoresCubit>(context).Champions,
  //                       selectedValue: BlocProvider.of<ScoresCubit>(context)
  //                           .selectedPlayer,
  //                       onChanged: (val) {
  //                         BlocProvider.of<ScoresCubit>(context)
  //                             .selectValueChampoinLeague(val.toString());
  //                       },
  //                     )),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           Center(
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 12.0),
  //               child: TxtButton(
  //                 color: primaryColor,
  //                 text: LocaleKeys.competitions_screen_apply.tr(),
  //                 borderRadius: 10,
  //                 horizontalPadding: 35,
  //                 verticalPadding: 10,
  //                 onPressed: () {
  //                   cubit.applyFilter();
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// ===================== Yesterday - Today - Tomorrow Section ===================
  Widget categoryItem({
    required String txt,
    required double width,
    required double height,
    required onPressed,
    required bgColor,
    required txtColor,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(width / 3.2, height / 15),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(color: txtColor, fontSize: 16),
      ),
    );
  }

  /// ================================== Match Item  ================================
  Widget matchItem({
    required GeneralMatchModel match,
    required double width,
    required double height,
    required int selectedTabIndex,
  }) {
    late String displayedDate;
    if (selectedTabIndex == 0) displayedDate = yesterday.toString();
    if (selectedTabIndex == 1) displayedDate = today.toString();
    if (selectedTabIndex == 2) displayedDate = tomorrow.toString();
    return InkWell(
      onTap: () => navigateTo(
        context,
        ChampionMatchResultScreen(
          generalMatch: match,
          championName: null,
          isFromGeneralMatches: true,
        ),
      ),
      child: Container(
        height: selectedTabIndex != 0 ? height / 3.1 : height / 3.5,
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 3.3,
                  // color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          match.firstTeamAvatar.isNotEmpty
                              ? match.firstTeamAvatar
                              : "https://picsum.photos/250?image=100",
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        match.firstTeamName,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        match.firstTeamScore,
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
                SizedBox(
                  width: width / 3.0,
                  child: Column(
                    children: [
                      Text(
                        match.countryTiming,
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        // "$displayedDate - ${match.time}",
                        displayedDate,
                        style: TextStyle(
                          color: Color(0xFF808080),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        match.time,
                        style: TextStyle(
                          color: Color(0xFF808080),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Visibility(
                        visible: selectedIndex == 2 ? false : true,
                        child: Text(
                          LocaleKeys.general_matches_has_ended.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 3.3,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          match.secondTeamAvatar.isNotEmpty
                              ? match.secondTeamAvatar
                              : "https://picsum.photos/250?image=100",
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        match.secondTeamName,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFB5B5B5),
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        match.secondTeamScore,
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
            const SizedBox(height: 2),

            /// Divider
            const Divider(endIndent: 18, indent: 18, color: Color(0xFF808080)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.live_tv_outlined,
                          color: primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: width / 3.3,
                          child: Text(
                            match.tvChannel.isNotEmpty
                                ? match.tvChannel
                                : LocaleKeys.general_matches_unknown.tr(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          '${assetImageBaseUrl}trophy.png',
                          width: 25,
                          height: 20,
                          color: primaryColor,
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: width / 3.3,
                          child: Text(
                            match.league,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 4),
            Visibility(
              visible: selectedTabIndex == 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ticket Price from  ",
                          style:
                              TextStyle(color: Color(0xFF808080), fontSize: 14),
                        ),
                        Text(
                          "149£",
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.21],
                          colors: [
                            Color(0xD9F9F9F9),
                            Color(0xffCDA250),
                          ],
                        ),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          navigateTo(context, TicketDetailsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            " Buy ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: selectedTabIndex == 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ticket Price from  ",
                          style:
                              TextStyle(color: Color(0xFF808080), fontSize: 14),
                        ),
                        Text(
                          "149£",
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 35,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.21],
                          colors: [
                            Color(0xD9F9F9F9),
                            Color.fromARGB(255, 155, 153, 149),
                          ],
                        ),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            " Sold ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ===============================================================================
}
