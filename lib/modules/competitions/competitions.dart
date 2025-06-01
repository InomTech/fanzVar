
// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/competitions/competions_widgets.dart';
import 'package:fanzhashem/modules/competitions/cubit/cubit.dart';
import 'package:fanzhashem/modules/competitions/cubit/states.dart';
import 'package:fanzhashem/modules/create_competition/first_create_competition.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Competitions extends StatefulWidget {
  const Competitions({super.key});

  @override
  _CompetitionsState createState() => _CompetitionsState();
}

class _CompetitionsState extends State<Competitions>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;
  List sponsors = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == Locale('en') ? true : false;
    return BlocProvider<CompetitionsCubit>(
      create: (context) => CompetitionsCubit()
        ..getSponsors('football')
        ..getCompetitionsData(isEnglish),
      child: BlocConsumer<CompetitionsCubit, CompetitionsStates>(
          listener: (context, state) async {
        if (state is ApplyFilterSuccess) {
          Navigator.pop(context);
          showToast(msg: "Filter applied successfully");
        }
        if (state is GetSponsorsState) {
          sponsors = state.sponsors[0];
        }
      }, builder: (context, state) {
        final footballComps =
            CompetitionsCubit.get(context).footballCompetitions;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              appBar: appBar(
                  _scaffoldKey,
                  "${LocaleKeys.home_screen_football.tr()} ${LocaleKeys.competitions_screen_competitions.tr()}",
                  context,
                  isEn: context.locale == Locale('en') ? true : false,
                  isShowFilter: true, filterFunc: () {
                BlocProvider.of<CompetitionsCubit>(context)
                    .fromDateController
                    .clear();
                BlocProvider.of<CompetitionsCubit>(context)
                    .toDateController
                    .clear();

                return showFilterCompetitionAlertDialog(
                    context, BlocProvider.of<CompetitionsCubit>(context));
              }),
              backgroundColor: lightBlackColor,
              body: SingleChildScrollView(
                // height: 1000,
                child: Column(
                  children: [
                    sponsor(sponsors, Colors.transparent),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .75,
                      child: footballComps != null &&
                              footballComps.competitions!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: primaryColor,
                                  indicatorColor: primaryColor,
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  tabs: [
                                    Tab(
                                      text: LocaleKeys
                                          .competitions_screen_available
                                          .tr(),
                                    ),
                                    Tab(
                                      text: LocaleKeys
                                          .competitions_screen_completed
                                          .tr(),
                                    )
                                  ],
                                  controller: _tabController,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      CompetitionsList(
                                        competitions:
                                            footballComps.competitions!,
                                        isAvaliable: true,
                                        history: false,
                                      ),
                                      CompetitionsList(
                                        competitions:
                                            footballComps.competitions!,
                                        isAvaliable: false,
                                        history: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.add,
                  color: darkBlackColor,
                  size: 30,
                ),
                onPressed: () {
                  navigateTo(context, FirstCreateCompetition());
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
