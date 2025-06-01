import 'package:fanzhashem/models/club_profile/club_matches_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

import '../../models/club_profile/club_play_list_model.dart';
import '../../widgets/shared_widget.dart';
import '../modules/player_profile/player_profile_screen.dart';

late Map<String, List<ClubMatchesModel>> mapPerDate;

class ScorresGoalsWidget extends StatefulWidget {
  final List<FirstClubAttackModel>? scorregoal;
  const ScorresGoalsWidget({required this.scorregoal, super.key});

  @override
  State<ScorresGoalsWidget> createState() => _ScorresGoalTabState();
}

class _ScorresGoalTabState extends State<ScorresGoalsWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.scorregoal);
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.9,
            // mainAxisExtent: 1,
            crossAxisCount: 2),
        shrinkWrap: true,
        reverse: false,
        itemCount: widget.scorregoal!.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height / 1,
              // height: double.infinity,
              // width: double.infinity,
              // width: width / 4,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: lightBlackColor,
                border: Border.all(color: Color(0xFF424242)),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: playerscore(
                  height: height,
                  playername: widget.scorregoal![index].playerName,
                  playerPicture: widget.scorregoal![index].playerPicture,
                  score: widget.scorregoal![index].numberGoals,
                  playerId: widget.scorregoal![index].id,
                  clubName: widget.scorregoal![index].clubName),
            ),
          );
        }));
  }
}

class playerscore extends StatelessWidget {
  const playerscore(
      {super.key,
      required this.height,
      required this.playername,
      required this.playerPicture,
      required this.score,
      required this.playerId,
      this.clubName});

  final double height;
  final int? score;
  final String playername;
  final int playerId;
  final String playerPicture;
  final String? clubName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          navigateTo(
              context, PlayerProfileScreen(playerID: playerId.toString()));
        },
        child: Column(
          children: [
            Container(
              height: height / 8,
              width: 90,
              decoration: BoxDecoration(
                color: lightBlackColor,
                // border: Border.all(color: Color(0xFF424242)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(playerPicture),
              ),
            ),
            SizedBox(height: 4),
            Text(playername,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            Text(clubName!,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 4),
            Container(
              // color: Colors.white,
              // height: height / 17,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.grey,
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(0.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    score.toString(),
                    style: TextStyle(color: primaryColor),
                  ),
                  SizedBox(height: 2),
                  Text("Goals",
                      style: TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
          ],
        )
        //  ListTile(
        //   leading:
        //   Container(
        //     height: height / 6,
        //     width: 90,
        //     decoration: BoxDecoration(
        //       color: lightBlackColor,
        //       // border: Border.all(color: Color(0xFF424242)),
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(10.0),
        //       ),
        //     ),
        //     child: CircleAvatar(
        //       radius: 10,
        //       backgroundImage: NetworkImage(playerPicture),
        //     ),
        //   ),
        //   title: Text(playername,
        //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        //   // subtitle: Text(club,
        //   //     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        //   trailing: Container(
        //     height: height / 13,
        //     width: 50,
        //     decoration: BoxDecoration(
        //       color: lightBlackColor,
        //       border: Border.all(color: Color(0xFF424242)),
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(0.0),
        //       ),
        //     ),
        //     child: Column(
        //       children: [
        //         SizedBox(height: 6),
        //         Text(
        //           score.toString(),
        //           style: TextStyle(color: primaryColor),
        //         ),
        //         SizedBox(height: 8),
        //         Text("Goals"),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
