import 'package:fanzhashem/modules/other_sports/cubit/cubit.dart';
import 'package:fanzhashem/modules/other_sports/cubit/states.dart';
import 'package:fanzhashem/modules/other_sports/other_sports_widgets.dart';
import 'package:fanzhashem/modules/other_sports/team_sport.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'indiviual_sport.dart';

class OtherSports extends StatefulWidget {
  const OtherSports({super.key});

  @override
  _OtherSportsState createState() => _OtherSportsState();
}

class _OtherSportsState extends State<OtherSports> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List sponsors = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtherSportsCubit>(
      create: (context) => OtherSportsCubit()
        ..getSponsors('other_sport')
        ..getOtherSports(),
      child: BlocConsumer<OtherSportsCubit, OtherSportsStates>(
        listener: (context, state) async {
          if (state is GetSponsorsState) {
            sponsors = state.sponsors[0];
          }
        },
        builder: (context, state) {
          final otherSports = OtherSportsCubit.get(context).otherSports;
          return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            appBar: appBar(_scaffoldKey, "Other Sports", context),
            backgroundColor: lightBlackColor,
            body: SizedBox(
              height: 1000,
              child: Column(
                children: [
                  sponsor(sponsors, Colors.transparent),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      height: 450,
                      child: BlocProvider.of<OtherSportsCubit>(context)
                                  .otherSports ==
                              null
                          ? ShowLoading()
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  if (otherSports.sports![index].type ==
                                      "Individual") {
                                    navigateTo(
                                        context,
                                        IndividualSport(
                                            otherSport:
                                                otherSports.sports![index]));
                                  } else {
                                    navigateTo(
                                      context,
                                      TeamSport(
                                        otherSport: otherSports.sports![index],
                                        history: false,
                                      ),
                                    );
                                  }
                                },
                                child: OtherSportsItem(
                                    name: "${otherSports.sports![index].name}",
                                    imagePath:
                                        "${otherSports.sports![index].imageProfile}"),
                              ),
                              itemCount: otherSports!.sports!.length,
                            ),
                    ),
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
