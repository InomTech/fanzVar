import 'package:fanzhashem/modules/competitions/competions_widgets.dart';
import 'package:fanzhashem/modules/create_competition/first_create_competition.dart';
import 'package:fanzhashem/modules/other_sports/cubit/cubit.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class TeamSport extends StatefulWidget {
  final otherSport;
  final bool history;
  const TeamSport({super.key, required this.history, required this.otherSport});
  @override
  _TeamSportState createState() => _TeamSportState();
}

class _TeamSportState extends State<TeamSport> with TickerProviderStateMixin {
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
    print(widget.otherSport);
    return BlocProvider<OtherSportsCubit>(
      create: (context) => OtherSportsCubit()
        ..getSponsors('other_sport')
        ..getTeamSportsData(widget.history == false
            ? widget.otherSport.name
            : 'Competition History'),
      child: BlocConsumer<OtherSportsCubit, OtherSportsStates>(
          listener: (context, state) async {
        if (state is ApplyFilterSuccess) {
          Navigator.pop(context);
          showToast(msg: "Filter applied successfully");
        }
        if (state is GetSponsorsState) {
          sponsors = state.sponsors[0];
        }
      }, builder: (context, state) {
        final player = OtherSportsCubit.get(context).player;
        final appbloc = OtherSportsCubit.get(context);
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
                    widget.history == false
                        ? "${widget.otherSport.name}"
                        : 'Competition History',
                    context,
                    isShowFilter: true, filterFunc: () {
                  appbloc.fromDateController.clear();
                  appbloc.toDateController.clear();

                  return showFilterCompetitionAlertDialog(context, appbloc);
                }),
                backgroundColor: lightBlackColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      sponsor(sponsors, Colors.transparent),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: player != null && player.players!.isNotEmpty
                            ? widget.history == false
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            text: 'Available',
                                          ),
                                          Tab(
                                            text: 'Completed',
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
                                                competitions: player.players!,
                                                isAvaliable: true,
                                                history: false),
                                            CompetitionsList(
                                                competitions: player.players!,
                                                isAvaliable: false,
                                                history: false),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : CompetitionsList(
                                    competitions: player.players!,
                                    isAvaliable: false,
                                    history: true)
                            : Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: widget.history == false
                    ? FloatingActionButton(
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.add,
                          color: darkBlackColor,
                          size: 30,
                        ),
                        onPressed: () {
                          navigateTo(context, FirstCreateCompetition());
                        },
                      )
                    : SizedBox()),
          ),
        );
      }),
    );
  }
}
