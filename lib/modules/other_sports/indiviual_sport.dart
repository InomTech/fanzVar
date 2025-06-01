import 'package:fanzhashem/modules/playstation/playstation_players_widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class IndividualSport extends StatefulWidget {
  final otherSport;
  const IndividualSport({super.key, required this.otherSport});

  @override
  _IndividualSportState createState() => _IndividualSportState();
}

class _IndividualSportState extends State<IndividualSport>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  bool isSearching = false;

  final searchController = TextEditingController();
  List sponsors = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtherSportsCubit>(
      create: (context) => OtherSportsCubit()
        ..getSponsors('other_sport')
        ..getPlaystaionsPlayersData(widget.otherSport.name),
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
        final players = OtherSportsCubit.get(context).player;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              appBar: appBar(_scaffoldKey, "${widget.otherSport.name}", context,
                  isSearching: isSearching, refresh: refresh),
              backgroundColor: lightBlackColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    sponsor(sponsors, Colors.transparent),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: players != null && players.players!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                //   margin:
                                //       EdgeInsets.only(top: 25.0, right: 20, left: 20),
                                //   child: TxtField(
                                //     controller: searchController,
                                //     hintText: "Player Name / Game",
                                //     validator: (value) {
                                //       if (value.toString().isEmpty || value == null) {
                                //         return 'Please enter a player name / game !';
                                //       } else if (double.tryParse(value) != null) {
                                //         return 'Player Name / Game must be text only';
                                //       }
                                //     },
                                //     prefixIcon: Icons.search,
                                //     colorPrefixIcon: primaryColor,
                                //     keyboardType: TextInputType.name,
                                //     onChanged: (String str) {
                                //       searchController.text = str;
                                //       searchController.selection =
                                //           TextSelection.fromPosition(TextPosition(
                                //               offset: searchController.text.length));
                                //       setState(() {});
                                //     },
                                //   ),
                                // ),
                                SizedBox(
                                  height: isSearching ? 15 : 0,
                                ),
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
                                      PlayStationPlayersList(
                                        searchTxt: searchController.text,
                                        playstationPlayer: players.players!,
                                        isBusy: false,
                                      ),
                                      PlayStationPlayersList(
                                          searchTxt: searchController.text,
                                          playstationPlayer: players.players!,
                                          isBusy: true),
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
            ),
          ),
        );
      }),
    );
  }

  refresh() {
    isSearching = !isSearching;
    setState(() {});
    print("refreshed");
  }
}
