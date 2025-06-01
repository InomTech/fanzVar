import 'package:fanzhashem/modules/club/club_profile.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChampionDetails extends StatefulWidget {
  final championDetails;

  const ChampionDetails({super.key, required this.championDetails});

  @override
  _ChampionDetailsState createState() => _ChampionDetailsState();
}

class _ChampionDetailsState extends State<ChampionDetails> {
  List<String> bodies = ["FIFA"];
  List sponsors = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider<ChampionCubit>(
      create: (context) => ChampionCubit()..getSponsors('champion'),
      child: BlocConsumer<ChampionCubit, ChampionStates>(
        listener: (context, state) async {
          if (state is GetSponsorsState) {
            sponsors = state.sponsors[0];
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: lightBlackColor,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  sponsor(sponsors, darkBlackColor),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: 'About',
                    valueStr: "${widget.championDetails['About']}.\n",
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: 'Current Champions',
                    valueStr: widget.championDetails['Country'],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: "Founded",
                    valueStr: widget.championDetails['Founded'],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: "Number Of Teams",
                    valueStr: widget.championDetails['NumOfTeams'],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: "Next Date",
                    valueStr: widget.championDetails['NextDate'],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: "Most successful team",
                    valueStr: widget.championDetails['MostSuccessfulTeam'],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  ContainerWidget(
                    keyStr: "Website",
                    valueStr: widget.championDetails['Website'] ??
                        "https://www.fifa.com/tournaments/mens/worldcup",
                    isWebSite: true,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
