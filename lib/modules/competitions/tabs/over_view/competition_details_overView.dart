import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/competitions/competions_widgets.dart';
import 'package:fanzhashem/modules/create_team/create_team.dart';
import 'package:fanzhashem/modules/matches/matches.dart';
import 'package:fanzhashem/modules/shared/competition_details_widgets.dart'
    as com_details;
import 'package:fanzhashem/modules/shared/gallery.dart' as g;
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class CompetitionDetailsOverView extends StatefulWidget {
  final competition;
  final history;
  const CompetitionDetailsOverView(
      {super.key, required this.history, required this.competition});

  @override
  State<CompetitionDetailsOverView> createState() =>
      _CompetitionDetailsOverViewState();
}

class _CompetitionDetailsOverViewState
    extends State<CompetitionDetailsOverView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        SizedBox(height: height / 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LocaleKeys.home_screen_matches.tr(),
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  )),
              GestureDetector(
                onTap: () {
                  navigateTo(context, Matches());
                },
                child: Text(LocaleKeys.general_see_all.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    )),
              ),
            ],
          ),
        ),
        com_details.Match(
            firstTeamName: LocaleKeys.competitions_screen_abtal_faisl.tr(),
            firstTeamScore: "0",
            secondTeamName: LocaleKeys.competitions_screen_talbia_stars.tr(),
            secondTeamScore: "1",
            matchDate: formattedNowDate),
        SizedBox(height: height / 40),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.competitions_screen_gallery.tr(),
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context,
                          g.Gallery(galleryImages: widget.competition.gallery));
                    },
                    child: Text(LocaleKeys.general_see_all.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        )),
                  ),
                ],
              ),
            ),
            com_details.GalleryGridView(
                galleryImages: widget.competition.gallery),
          ],
        ),
        SizedBox(height: height / 40),
        widget.history != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TxtButton(
                    color: widget.competition.isJoined == true
                        ? darkBlackColor
                        : primaryColor,
                    text: widget.competition.isJoined == true
                        ? "Joined"
                        : "Join Team",
                    // text: LocaleKeys.competitions_screen_join_team.tr(),
                    borderRadius: 10,
                    horizontalPadding: width / 10,
                    verticalPadding: 10,
                    onPressed: () {
                      showJoinTeamAlertDialog(
                          context, widget.competition, () {});
                    },
                  ),
                  TxtButton(
                    color: lightBlackColor,
                    borderColor: primaryColor,
                    // text: "Create Your Team",
                    text: LocaleKeys.competitions_screen_create_new_team.tr(),
                    borderRadius: 10,
                    horizontalPadding: width / 17,
                    verticalPadding: 10,
                    onPressed: () => navigateTo(context, CreateTeam()),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(height: 20),
        widget.history != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TxtButton(
                    color: lightBlackColor,
                    borderColor: primaryColor,
                    text: "Join next Competition",
                    borderRadius: 10,
                    horizontalPadding: width / 17,
                    verticalPadding: 10,
                    onPressed: () => showToast(
                        msg: 'You Have Joined next Competition Successfully'),
                  ),
                  TxtButton(
                    color: lightBlackColor,
                    borderColor: primaryColor,
                    text: "Join as a Camera man",
                    borderRadius: 10,
                    horizontalPadding: width / 17,
                    verticalPadding: 10,
                    onPressed: () => showToast(
                        msg: 'You Have Joined as a Camera man Successfully'),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(height: 10),
        widget.history != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TxtButton(
                    color: lightBlackColor,
                    borderColor: primaryColor,
                    text: "Join as a Referee",
                    borderRadius: 10,
                    horizontalPadding: width / 17,
                    verticalPadding: 10,
                    onPressed: () => showToast(
                        msg: 'You Have Joined as a Referee Successfully'),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(height: height / 10),
      ],
    );
  }
}
