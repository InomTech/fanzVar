import 'package:fanzhashem/models/team_ranking_model.dart';
import 'package:fanzhashem/modules/club_profile/club_profile_screen.dart';
import 'package:fanzhashem/modules/ranking/cubit/states.dart';
import 'package:fanzhashem/modules/ranking/drop_down_list.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int selectedIndex = 0;
  List<TeamRankingModel> activeTeamsList = [];
  List<TeamRankingModel> nationalTeamsList = [];
  IconData totalSortIcon = Icons.arrow_downward;
  IconData fansSortIcon = Icons.arrow_upward;
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "1",
  //     teamName: "Belgium",
  //     teamAvatar: "assets/images/BEL.png",
  //     profit: "",
  //     country: "",
  //     fans: "2 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "2",
  //     teamName: "Brazil",
  //     teamAvatar: "assets/images/BRA.png",
  //     profit: "",
  //     country: "",
  //     fans: "1.5 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "3",
  //     teamName: "France",
  //     teamAvatar: "assets/images/BRA.png",
  //     profit: "",
  //     country: "",
  //     fans: "1 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "4",
  //     teamName: "Argentina",
  //     teamAvatar: "assets/images/ARG.png",
  //     profit: "",
  //     country: "",
  //     fans: "900 k",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "5",
  //     teamName: "Englan",
  //     teamAvatar: "assets/images/ENG.png",
  //     profit: "",
  //     country: "",
  //     fans: "890 k",
  //   ),
  // ];
  List<TeamRankingModel> localTeamsList = [];
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "1",
  //     teamName: "LiverPool FC",
  //     teamAvatar: "assets/images/liverpool.png",
  //     country: "England",
  //     profit: "",
  //     fans: "10 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "2",
  //     teamName: "Bayern Munchen",
  //     teamAvatar: "assets/images/Bayern.png",
  //     country: "Germany",
  //     profit: "",
  //     fans: "9.1 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "3",
  //     teamName: "Manchester City",
  //     teamAvatar: "assets/images/manchester.png",
  //     country: "England",
  //     profit: "",
  //     fans: "8.8 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "4",
  //     teamName: "Chelsea FC",
  //     teamAvatar: "assets/images/chelsea.png",
  //     country: "England",
  //     profit: "",
  //     fans: "8.6 M",
  //   ),
  //   TeamRankingModel(
  //     id: "1",
  //     rank: "5",
  //     teamName: "Real Madrid",
  //     teamAvatar: "assets/images/realMadred.png",
  //     country: "Spain",
  //     profit: "",
  //     fans: "10 M",
  //   ),
  // ];
  @override
  void initState() {
    super.initState();
    // activeTeamsList = nationalTeamsList;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (BuildContext context) => RankingCubit()
        ..getRankingList()
        ..getCountryRegion(),
      child: BlocConsumer<RankingCubit, RankingStates>(
        listener: (context, state) {
          if (state is GetRankingListState) {
            localTeamsList = state.localRankingList;
            nationalTeamsList = state.nationalRankingList;
            activeTeamsList = nationalTeamsList;
          }
          if (state is GetClubProfileDataState) {
            print(state);
            navigateTo(
              context,
              ClubProfileScreen(
                  info: state.info, isFirstTeam: state.isFirstTeam),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text("Teams Ranking"),
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
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text('Country :',
                                  style: TextStyle(fontSize: 16))),
                          SizedBox(height: 5),
                          DropDownList(
                              dropdownValue:
                                  RankingCubit.get(context).dropDownCountry,
                              arrList: RankingCubit.get(context).countries,
                              fun: (value) {
                                RankingCubit.get(context)
                                    .changeDropDownCountry(value);
                              }),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Region :",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 5),
                          DropDownList(
                              dropdownValue:
                                  RankingCubit.get(context).dropDownRegion,
                              arrList: RankingCubit.get(context).regions,
                              fun: (value) {
                                RankingCubit.get(context)
                                    .changeDropDownRegion(value);
                              }),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///==========  National - Local Section ===========
                  Container(
                    height: height / 15,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        late String txt;
                        if (index == 0) txt = "National";
                        if (index == 1) txt = "Local";
                        return Padding(
                          padding: index == 1
                              ? const EdgeInsets.only(right: 0.0)
                              : const EdgeInsets.only(right: 8.0),
                          child: categoryItem(
                            txt: txt,
                            width: width,
                            height: height,
                            txtColor: isSelected ? Colors.black : Colors.white,
                            bgColor:
                                isSelected ? primaryColor : lightBlackColor,
                            onPressed: () {
                              setState(() {
                                selectedIndex = index;
                                if (index == 0) {
                                  activeTeamsList = nationalTeamsList;
                                }

                                if (index == 1) {
                                  activeTeamsList = localTeamsList;
                                }
                                // totalSortIcon = Icons.arrow_upward;
                                // fansSortIcon = Icons.arrow_upward;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  //++++++++++++++++++ sorting icons +++++++++++++++++++
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: sorttByTotal, icon: Icon(totalSortIcon)),
                      SizedBox(width: width / 40),
                      IconButton(
                          onPressed: sorttByFans, icon: Icon(fansSortIcon)),
                      SizedBox(width: width / 80),
                    ],
                  ),

                  ///============== Active Teams Section ============
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: activeTeamsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            RankingCubit.get(context)
                                .getClubProfileData(activeTeamsList[index].id);
                            // navigateTo(context, ClubProfileScreen(info: info));
                          },
                          child: teamItem(
                              activeTeamsList[index], index, height, width),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// ===================== National / Local Section ===================
  Widget categoryItem({
    required String txt,
    required double width,
    required double height,
    required onPressed,
    required bgColor,
    required txtColor,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(width / 2.2, height / 15),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(color: txtColor, fontSize: 17),
      ),
    );
  }

////===============================
  /// ======================= Team Item ===========================
  Widget teamItem(TeamRankingModel team, index, height, width) {
    return selectedIndex == 0
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Stack(
              children: [
                Container(
                  height: height / 8,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Rank",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF8EA2AB),
                            ),
                          ),
                          SizedBox(height: height / 30),
                          Text(team.rank),
                        ],
                      ),
                      SizedBox(
                        width: width / 2.5,
                        child: ListTile(
                          horizontalTitleGap: 10.0,
                          leading: Image.asset(
                            team.teamAvatar,
                            width: width / 9,
                            height: 60,
                          ),
                          title: Text(
                            team.teamName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            // ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Total profit",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF8EA2AB),
                            ),
                          ),
                          SizedBox(height: height / 30),
                          Text("${team.profit}\$"),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Fans",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF8EA2AB),
                            ),
                          ),
                          SizedBox(height: height / 30),
                          Text("${team.fans}"),
                        ],
                      ),
                    ],
                  ),
                ),
                if (index == 0)
                  Positioned(
                    child: Container(
                      height: height / 8,
                      width: 6,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                          )),
                    ),
                  ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Container(
              height: height / 8,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: lightBlackColor,
                border: Border.all(color: Color(0xFF424242)),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Text(team.rank),
                    ],
                  ),
                  SizedBox(
                    width: width / 2.2,
                    child: ListTile(
                      horizontalTitleGap: 0.0,
                      leading: Transform.translate(
                        offset: Offset(-18, 0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            team.teamAvatar,
                          ),
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-12, 0),
                        child: Text(
                          team.teamName,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      subtitle: Transform.translate(
                        offset: Offset(-12, 0),
                        child: Text(
                          team.country,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8EA2AB),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Total profit",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Text("${team.profit}\$"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Fans",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8EA2AB),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Text("${team.fans}"),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  sorttByTotal() {
    if (totalSortIcon == Icons.arrow_downward) {
      RankingCubit().sortListByTotal(nationalTeamsList, localTeamsList, "up");
      setState(() {
        totalSortIcon = Icons.arrow_upward;
        fansSortIcon = Icons.arrow_downward;
      });
    } else {
      RankingCubit().sortListByTotal(nationalTeamsList, localTeamsList, "down");
      setState(() {
        totalSortIcon = Icons.arrow_downward;
        fansSortIcon = Icons.arrow_upward;
      });
    }
  }

  sorttByFans() {
    if (fansSortIcon == Icons.arrow_downward) {
      RankingCubit().sortListByFans(nationalTeamsList, localTeamsList, "up");
      setState(() {
        fansSortIcon = Icons.arrow_upward;
        totalSortIcon = Icons.arrow_downward;
      });
    } else {
      RankingCubit().sortListByFans(nationalTeamsList, localTeamsList, "down");
      setState(() {
        fansSortIcon = Icons.arrow_downward;
        totalSortIcon = Icons.arrow_upward;
      });
    }
  }
}
