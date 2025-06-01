import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/shared/competition_details.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../create_team/create_team.dart';

class CompetitionsList extends StatefulWidget {
  final List competitions;
  final bool isAvaliable;
  final bool history;
  const CompetitionsList({
    super.key,
    required this.competitions,
    required this.isAvaliable,
    required this.history,
  });

  @override
  State<CompetitionsList> createState() => _CompetitionsListState();
}

class _CompetitionsListState extends State<CompetitionsList> {
  List filterList = [];
  @override
  void initState() {
    super.initState();
    for (var item in widget.competitions) {
      if (item.isAvailable == widget.isAvaliable) {
        filterList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (BuildContext context, int index) {
        return CompetitonItem(
          competition: filterList[index],
          history: widget.history,
        );
      },
    );
  }
}

class CompetitonItem extends StatefulWidget {
  final competition;
  final bool history;

  const CompetitonItem(
      {super.key, required this.history, required this.competition});

  @override
  State<CompetitonItem> createState() => _CompetitonItemState();
}

class _CompetitonItemState extends State<CompetitonItem> {
  var dateTime;

  @override
  Widget build(BuildContext context) {
    dateTime =
        DateFormat.yMMMMd(context.locale == Locale('en') ? 'en_US' : "ar")
            .format(DateTime.now().add(Duration(days: 30)));
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(
                10.0), //                 <--- border radius here
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${widget.competition.name}",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Location: ${widget.competition.location}",
                // LocaleKeys.competitions_screen_team_name
                //     .tr(args: [widget.competition.teamName]),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "City: ${widget.competition.city}",
                // LocaleKeys.competitions_screen_team_name
                //     .tr(args: [widget.competition.teamName]),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                // "Age: ${competition.age}",
                LocaleKeys.competitions_screen_age
                    .tr(args: [widget.competition.age.toString()]),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Max Teams : ${widget.competition.maxTeams.toString()}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                "Total Teams :${widget.competition.totalTeams.toString()}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Text(
                widget.history != true
                    ? "Start Date: " + dateTime
                    : "Start Date: " " october 8 2021",

                // LocaleKeys.competitions_screen_start_date
                //     .tr(args: ${dateTime}),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              // Text(
              //   "Age between 19:25",
              //   style: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              // ),
              Text(
                "Duration: 30 day",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 30),
              widget.competition.isJoined == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TxtButton(
                          color: primaryColor,
                          text: LocaleKeys.competitions_screen_create_new_team
                              .tr(),
                          borderRadius: 10,
                          horizontalPadding: 25,
                          verticalPadding: 10,
                          onPressed: () => navigateTo(context, CreateTeam()),
                        ),
                        //   TxtButton(
                        //   color: primaryColor,
                        //   text: widget.competition.isJoined == false
                        //       ? LocaleKeys.competitions_screen_join_team.tr()
                        //       : LocaleKeys.competitions_screen_joined.tr(),
                        //   borderRadius: 10,
                        //   horizontalPadding: 35,
                        //   verticalPadding: 10,
                        //   onPressed: widget.competition.isJoined == false
                        //       ? () {
                        //           showJoinTeamAlertDialog(
                        //             context,
                        //             widget.competition,
                        //             () {
                        //               setState(() {
                        //                 widget.competition.isJoined = true;
                        //               });
                        //               print(widget.competition);
                        //             },
                        //           );
                        //         }
                        //       : null,
                        // ),
                        TxtButton(
                          color: lightBlackColor,
                          borderColor: primaryColor,
                          text:
                              LocaleKeys.competitions_screen_more_details.tr(),
                          borderRadius: 10,
                          horizontalPadding: 35,
                          verticalPadding: 15,
                          onPressed: () => navigateTo(
                              context,
                              CompetitionDetails(
                                  competition: widget.competition,
                                  history: widget.history)),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TxtButton(
                          color: lightBlackColor,
                          borderColor: primaryColor,
                          text:
                              LocaleKeys.competitions_screen_more_details.tr(),
                          borderRadius: 10,
                          horizontalPadding: 35,
                          verticalPadding: 15,
                          onPressed: () => navigateTo(
                              context,
                              CompetitionDetails(
                                  competition: widget.competition,
                                  history: widget.history)),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

/// join team Alert

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

showFilterCompetitionAlertDialog(context, cubit) => showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
          height: MediaQuery.of(context).size.height / 4,
          child: Form(
            key: cubit.filterFormKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25.0, right: 20, left: 20),
                  child: TxtField(
                    controller: cubit.fromDateController,
                    hintText: LocaleKeys.competitions_screen_from_date.tr(),
                    validator: (value) {
                      if (value.toString().isEmpty || value == null) {
                        return LocaleKeys.competitions_screen_from_date.tr();
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
                  margin: EdgeInsets.only(top: 25.0, right: 20, left: 20),
                  child: TxtField(
                    controller: cubit.toDateController,
                    hintText: LocaleKeys.competitions_screen_to_date.tr(),
                    validator: (value) {
                      if (value.toString().isEmpty || value == null) {
                        return LocaleKeys.competitions_screen_to_date_msg.tr();
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
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
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
      ),
    );
