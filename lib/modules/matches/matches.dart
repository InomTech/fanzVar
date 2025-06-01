import 'package:fanzhashem/modules/matches/match_details.dart';
import 'package:fanzhashem/modules/shared/competition_details_widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class Matches extends StatelessWidget {
  final bool showAppBar;

  Matches({super.key, this.showAppBar = true});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: showAppBar
          ? appBar(_scaffoldKey, "Matches", context)
          : AppBar(
        leading: Text(""),
        toolbarHeight: 0,
      ),
      backgroundColor: lightBlackColor,
      body: ListView.builder(
        itemCount: 10, // هنا يمكنك تعديل العدد بحسب الحاجة
        itemBuilder: (context, index) {
          // هنا، يمكنك تعديل البيانات لتتناسب مع البيانات الحقيقية
          return GestureDetector(
            onTap: () {
              navigateTo(
                  context,
                  MatchDetails(
                      firstTeamName: "Leeds United",
                      firstTeamScore: "0",
                      secondTeamName: "Liverpool",
                      secondTeamScore: "1",
                      matchDate: formattedNowDate));
            },
            child: Match(
                firstTeamName: "Real Madrid",
                firstTeamScore: "0",
                secondTeamName: "Liverpool",
                secondTeamScore: "1",
                matchDate: formattedNowDate),
          );
        },
      ),
    );
  }
}
