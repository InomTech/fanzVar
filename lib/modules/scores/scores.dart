// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:fanzhashem/models/scores_model.dart';
import 'package:fanzhashem/modules/scores/cubit/cubit.dart';
import 'package:fanzhashem/modules/scores/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Scores extends StatefulWidget {
  final List<ScoresModel> scores;

  const Scores({super.key, required this.scores});

  @override
  _ScoresState createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<ScoresCubit>(
      create: (context) => ScoresCubit(),
      child: BlocConsumer<ScoresCubit, ScoresStates>(
        listener: (context, state) async {},
        builder: (context, state) => Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: appBar(_scaffoldKey, "Matches schedule", context,
              isSearching: false),
          backgroundColor: lightBlackColor,
          body: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.scores.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      //navigateTo(context,ScoreDetails());
                    },
                    child: ScoreItem(
                      score: widget.scores[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreItem extends StatelessWidget {
  final ScoresModel score;

  ScoreItem({super.key, required this.score});

  String bgImage = '${assetImageBaseUrl}bac.jpg';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width / 1.3,
      height: height / 5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.colorBurn),
          image: AssetImage(bgImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(score.club1Name);

                          BlocProvider.of<ScoresCubit>(context)
                              .navigateToClub(score.club1Name ?? "", context);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(score.club1Image ?? ""),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        score.club1Name ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  score.score ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  width: width / 4,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(score.club2Name);

                          BlocProvider.of<ScoresCubit>(context)
                              .navigateToClub(score.club2Name ?? "", context);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(score.club2Image ?? ""),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        score.club2Name ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 35,
            ),
          ],
        ),
      ),
    );
  }
}
