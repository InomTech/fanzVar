import 'package:fanzhashem/modules/create_competition/first_create_competition.dart';
import 'package:fanzhashem/modules/playstation/cubit/cubit.dart';
import 'package:fanzhashem/modules/playstation/cubit/states.dart';
import 'package:fanzhashem/modules/playstation/playstation_players_widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayStationPlayers extends StatefulWidget {
  const PlayStationPlayers({super.key});

  @override
  _PlayStationPlayersState createState() => _PlayStationPlayersState();
}

class _PlayStationPlayersState extends State<PlayStationPlayers>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  bool isSearching = false;
  List sponsors = [];

  final searchController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayStationPlayersCubit>(
      create: (context) => PlayStationPlayersCubit()
        ..getSponsors('playstation')
        ..getPlaystaionsPlayersData(),
      child: BlocConsumer<PlayStationPlayersCubit, PlayStationPlayersStates>(
          listener: (context, state) async {
        if (state is ApplyFilterSuccess) {
          Navigator.pop(context);
          showToast(msg: "Filter applied successfully");
        }
        if (state is GetSponsorsState) {
          sponsors = state.sponsors[0];
        }
      }, builder: (context, state) {
        final playstationPlayer =
            PlayStationPlayersCubit.get(context).playstationPlayer;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              appBar: appBar(_scaffoldKey, "PS Competitions", context,
                  isSearching: isSearching, refresh: refresh),
              backgroundColor: lightBlackColor,
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    sponsor(sponsors, Colors.transparent),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: playstationPlayer != null &&
                              playstationPlayer.players!.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                isSearching
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: 25.0, right: 20, left: 20),
                                        child: TxtField(
                                          controller: searchController,
                                          hintText: "Player Name / Game",
                                          validator: (value) {
                                            if (value.toString().isEmpty ||
                                                value == null) {
                                              return 'Please enter a player name / game !';
                                            } else if (double.tryParse(value) !=
                                                null) {
                                              return 'Player Name / Game must be text only';
                                            }
                                          },
                                          prefixIcon: Icons.search,
                                          colorPrefixIcon: primaryColor,
                                          keyboardType: TextInputType.name,
                                          onChanged: (String str) {
                                            searchController.text = str;
                                            searchController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: searchController
                                                            .text.length));
                                            setState(() {});
                                          },
                                        ),
                                      )
                                    : Text(""),
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
                                        playstationPlayer:
                                            playstationPlayer.players!,
                                        isBusy: false,
                                      ),
                                      PlayStationPlayersList(
                                          searchTxt: searchController.text,
                                          playstationPlayer:
                                              playstationPlayer.players!,
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
