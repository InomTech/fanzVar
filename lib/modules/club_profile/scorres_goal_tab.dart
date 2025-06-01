import 'package:fanzhashem/models/club_profile/club_matches_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

import '../../models/club_profile/club_play_list_model.dart';
import '../../widgets/shared_widget.dart';
import '../player_profile/player_profile_screen.dart';

late Map<String, List<ClubMatchesModel>> mapPerDate;

class ScorresGoalTab extends StatefulWidget {
  final List<FirstClubAttackModel>? scorregoal;
  const ScorresGoalTab({required this.scorregoal, super.key});

  @override
  State<ScorresGoalTab> createState() => _ScorresGoalTabState();
}

class _ScorresGoalTabState extends State<ScorresGoalTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(widget.scorregoal);
    return ListView.builder(
      itemCount: widget.scorregoal!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: height / 9,
            width: double.infinity,
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
            ),
          ),
        );
      },
    );
  }
}

class playerscore extends StatelessWidget {
  const playerscore({
    super.key,
    required this.height,
    required this.playername,
    required this.playerPicture,
    required this.score,
    required this.playerId,
  });

  final double height;
  final int? score;
  final String playername;
  final int playerId;
  final String playerPicture;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, PlayerProfileScreen(playerID: playerId.toString()));
      },
      child: ListTile(
        leading: Container(
          height: height / 12,
          width: 60,
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
        title: Text(playername,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        // subtitle: Text(club,
        //     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        trailing: Container(
          height: height / 13,
          width: 50,
          decoration: BoxDecoration(
            color: lightBlackColor,
            border: Border.all(color: Color(0xFF424242)),
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 6),
              Text(
                score.toString(),
                style: TextStyle(color: primaryColor),
              ),
              SizedBox(height: 8),
              Text("Goals"),
            ],
          ),
        ),
      ),
    );
  }
}
