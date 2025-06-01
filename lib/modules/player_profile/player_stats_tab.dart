import 'package:fanzhashem/models/player_profile/stats_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

class PlayerStatsTab extends StatelessWidget {
  final stats;
  const PlayerStatsTab({required this.stats, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stats.length,
      itemBuilder: (BuildContext context, int index) {
        return statsWidget(stats[index]);
      },
    );
    // return ListView(
    //   children: [
    //     statsWidget(),
    //     statsWidget(),
    //   ],
    // );
  }

  Widget statsWidget(statsObj) {
    List statsList = statsObj["stats"]
        .map((e) => StatsModel.fromJson(e))
        .toList()
        .cast<StatsModel>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(statsObj["league_avatar"]),
                ),
                SizedBox(width: 8),
                Text(statsObj["league"])
              ],
            ),
            SizedBox(height: 8),
            Container(
              color: darkBlackColor,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Text(
                      "Years",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(flex: 5),
                    Image.asset("${assetImageBaseUrl}goals.png"),
                    Spacer(),
                    Image.asset("${assetImageBaseUrl}Stadium.png"),
                    Spacer(),
                    Image.asset("${assetImageBaseUrl}yellow.png"),
                    Spacer(),
                    Image.asset("${assetImageBaseUrl}red.png"),
                    Image.asset("${assetImageBaseUrl}Stadium.png"),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: statsList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: darkBlackColor,
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Container(
                    color: lightBlackColor,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          statsList[index].year,
                          style: TextStyle(color: Color(0x9CFBFBFB)),
                        ),
                        Spacer(flex: 4),
                        Text(statsList[index].goals,
                            style: TextStyle(color: Color(0x9CFBFBFB))),
                        Spacer(),
                        Text(statsList[index].greenCard,
                            style: TextStyle(color: Color(0x9CFBFBFB))),
                        Spacer(),
                        Text(statsList[index].yellowCard,
                            style: TextStyle(color: Color(0x9CFBFBFB))),
                        Spacer(),
                        Text(statsList[index].redCard,
                            style: TextStyle(color: Color(0x9CFBFBFB))),
                        Spacer(),
                        Text(statsList[index].assist,
                            style: TextStyle(color: Color(0x9CFBFBFB))),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
