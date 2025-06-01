import 'package:fanzhashem/models/player_profile/career_model.dart';
import 'package:fanzhashem/models/player_profile/news_model.dart';
import 'package:fanzhashem/modules/player_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/player_profile/cubit/states.dart';
import 'package:fanzhashem/modules/player_profile/player_career_tab.dart';
import 'package:fanzhashem/modules/player_profile/player_clubs_tab.dart';
import 'package:fanzhashem/modules/player_profile/player_news_tab.dart';
import 'package:fanzhashem/modules/player_profile/player_overview_tab.dart';
import 'package:fanzhashem/modules/player_profile/player_stats_tab.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerProfileScreen extends StatefulWidget {
  final String playerID;
  const PlayerProfileScreen({required this.playerID, super.key});

  @override
  _PlayerProfileScreenState createState() => _PlayerProfileScreenState();
}

class _PlayerProfileScreenState extends State<PlayerProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  var playerInfo;
  late var stats;
  late var singleAwards;
  late var publicAwords;
  late var careers;
  List playerNews = [];
  List playerCareer = [];
  int _activeIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (BuildContext context) =>
          PlayerProfileCubit()..getPlayerProfileInfo(widget.playerID),
      child: BlocConsumer<PlayerProfileCubit, PlayerProfileStates>(
        listener: (context, state) {
          if (state is GetPlayerProfileState) {
            //playerInfo = state.playerInfo;
            var news = playerInfo["news"];
            var career = playerInfo["career"];
            careers = playerInfo["career"];
            singleAwards = playerInfo["single_awards"];
            publicAwords = playerInfo["public_awards"];
            playerNews =
                // List<NewsModel>.from(news);
                news.map((e) => NewsModel.fromJson(e)).toList();
            playerCareer =
                // List<CareerModel>.from(career);
                career.map((e) => CareerModel.fromJson(e)).toList();
            stats = playerInfo["Stats"];
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text("Profile"),
              centerTitle: true,
              backgroundColor: lightBlackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: playerInfo != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: height / 3.0,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: width / 2.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(playerInfo[
                                                "player_Avatar"] ??
                                            "https://picsum.photos/250?image=110"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      playerInfo["player_name"] ??
                                          "Lionel Messi",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(playerInfo[
                                                  "team_avatar"] ??
                                              "https://picsum.photos/250?image=110"),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          playerInfo["team"] ?? "Liverpool",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 13),
                          TabBar(
                            unselectedLabelColor: primaryColor,
                            labelColor: Colors.black,
                            indicatorColor: primaryColor,
                            labelPadding: EdgeInsets.all(5),
                            labelStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                            tabs: [
                              Tab(
                                icon: Container(
                                  width: width / 2,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _activeIndex == 0
                                        ? primaryColor
                                        : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Overview",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Container(
                                  width: width / 3,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _activeIndex == 1
                                        ? primaryColor
                                        : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Stats",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Container(
                                  width: width / 3,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _activeIndex == 2
                                        ? primaryColor
                                        : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Career",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Container(
                                  width: width / 3,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _activeIndex == 3
                                        ? primaryColor
                                        : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Clubs",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Tab(
                                icon: Container(
                                  width: width / 3,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _activeIndex == 4
                                        ? primaryColor
                                        : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    "News",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                PlayerOverviewTab(playerInfo: playerInfo),
                                PlayerStatsTab(stats: stats),
                                PlayerCareerTab(career: careers),
                                // PlayerCareerTab(
                                //     playerCareer:
                                //         playerCareer.cast<CareerModel>()),
                                PlayerClubsTab(
                                    singleAwards: singleAwards,
                                    publicAwards: publicAwords),
                                PlayerNewsTab(
                                    playerNews: playerNews.cast<NewsModel>()),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }
}
