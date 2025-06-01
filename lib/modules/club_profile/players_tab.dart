import 'package:fanzhashem/models/club_profile/club_play_list_model.dart';
import 'package:fanzhashem/modules/player_profile/player_profile_screen.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class PlayerTab extends StatelessWidget {
  final List<FirstClubAttackModel>? goolkeeper;
  final List<FirstClubAttackModel>? defender;
  final List<FirstClubAttackModel>? center;
  final List<FirstClubAttackModel>? attack;
  const PlayerTab(
      {this.goolkeeper, this.attack, this.center, this.defender, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(goolkeeper);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: height,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Gool Keeper',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      for (var i = 0; i < goolkeeper!.length; i++)
                        PlayerList(
                            width: width,
                            height: height,
                            playlists: goolkeeper,
                            count: i),
                    ],
                  ),
                  // child: ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: BouncingScrollPhysics(),
                  //   itemCount: goolkeeper!.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return PlayerList(
                  //         width: width,
                  //         height: height,
                  //         playlists: goolkeeper![index],
                  //         count: index);
                  //   },
                  // ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            //////////////////////////////////////////
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Defenders',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      for (var i = 0; i < defender!.length; i++)
                        PlayerList(
                            width: width,
                            height: height,
                            playlists: defender,
                            count: i),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),

            //////////////////////////
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Centers',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      for (var i = 0; i < center!.length; i++)
                        PlayerList(
                            width: width,
                            height: height,
                            playlists: center,
                            count: i),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            //////attack///
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Attacks',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      for (var i = 0; i < attack!.length; i++)
                        PlayerList(
                            width: width,
                            height: height,
                            playlists: attack,
                            count: i),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerList extends StatelessWidget {
  final double width, height;

  final playlists;
  final count;
  const PlayerList(
      {required this.width,
      required this.height,
      this.playlists,
      this.count,
      super.key});

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < playlists!.length && i < 3; i++)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // width: width / 3.1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              PlayerProfileScreen(
                                  playerID: playlists![i].id.toString()));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(playlists![i].playerPicture),
                          // AssetImage("$assetImageBaseUrl$player1Img"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        playlists![i].playerName,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
            ],
          )
        : count == 3
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 3; i < playlists!.length; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      // width: width / 3.1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  PlayerProfileScreen(
                                      playerID: playlists![i].id.toString()));
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(playlists![i]
                                      .playerPicture ??
                                  "https://upload.wikimedia.org/wikipedia/commons/6/6c/Lionel_Messi_in_2018.jpg"),
                              // AssetImage("$assetImageBaseUrl$player1Img"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            playlists![i].playerName,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                ],
              )
            : SizedBox();
  }
}

class PlayerAvatar extends StatelessWidget {
  final double width, height;

  final String player1Name,
      player2Name,
      player3Name,
      player1Img,
      player2Img,
      player3Img;
  const PlayerAvatar(
      {required this.width,
      required this.height,
      required this.player1Name,
      required this.player2Name,
      required this.player3Name,
      required this.player1Img,
      required this.player2Img,
      required this.player3Img,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlackColor,
        border: Border.all(color: Color(0xFF424242)),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // width: width / 3.1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, PlayerProfileScreen(playerID: "1"));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("$assetImageBaseUrl$player1Img"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  player1Name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // width: width / 3.1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, PlayerProfileScreen(playerID: "1"));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("$assetImageBaseUrl$player2Img"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  player2Name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            // width: width / 3.1,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(context, PlayerProfileScreen(playerID: "1"));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("$assetImageBaseUrl$player3Img"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  player3Name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
