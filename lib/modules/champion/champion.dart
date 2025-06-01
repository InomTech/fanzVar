import 'package:fanzhashem/modules/champion/champion_overview_screen.dart';
import 'package:fanzhashem/modules/champion/champion_seeAll.dart';
import 'package:fanzhashem/modules/champion/cubit/cubit.dart';
import 'package:fanzhashem/modules/champion/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Champion extends StatefulWidget {
  const Champion({super.key});

  @override
  _ChampionState createState() => _ChampionState();
}

class _ChampionState extends State<Champion> {
  List<String> titles = ["International", "Africa", "Asia", "Europe"];

  List<String> bodies = ["FIFA"];
  List championList = [];
  @override
  void initState() {
    // if (mounted) {
    //   setState(() => championList = []);
    // }
    super.initState();
  }

  @override
  void dispose() {
    // animationController.dispose();
    // timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) => ChampionCubit()..getChampion(),
      child: BlocConsumer<ChampionCubit, ChampionStates>(
        listener: (context, state) async {
          if (state is GetChampionState) {
            championList = state.championList;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: darkBlackColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: championList.length,
                itemBuilder: (context, index) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(championList[index]["CategoryName"],
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                )),
                            GestureDetector(
                              onTap: () {
                                navigateTo(
                                  context,
                                  ChampionSeeAll(
                                    championList: championList[index]
                                        ["ChampionList"],
                                    categoryName: championList[index]
                                        ["CategoryName"],
                                  ),
                                );
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                          height: height / 7,
                          // color: Colors.red,
                          // alignment: Alignment.center,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  championList[index]["ChampionList"] == null
                                      ? 0
                                      : (championList[index]["ChampionList"]
                                                  .length >
                                              3
                                          ? 3
                                          : championList[index]["ChampionList"]
                                              .length),
                              itemBuilder: (context, subIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      navigateTo(
                                        context,
                                        ChampionOverviewScreen(
                                          champion: championList[index],
                                          championDetails: championList[index]
                                              ["ChampionList"][subIndex],
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: width / 3.3,

                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: lightBlackColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            championList[index]["ChampionList"]
                                                [subIndex]["Avatar"],
                                            width: width / 5,
                                            height: height / 15,
                                          ),
                                          Spacer(),
                                          Text(
                                            championList[index]["ChampionList"]
                                                    [subIndex]["Name"]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),

                                      // child: navigationBarBtn(
                                      //   "trophy.png",
                                      //   championList[index]["ChampionList"]
                                      //           [subIndex]["Name"]
                                      //       .toString(),
                                      //   false,
                                      //   height: height / 11,
                                      //   width: width / 4,
                                      //   isNetworkImg: true,
                                      //   networkImgURL: championList[index]
                                      //           ["ChampionList"][subIndex]
                                      //       ["Avatar"],
                                      // ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
