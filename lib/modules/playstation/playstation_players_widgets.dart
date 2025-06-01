import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/shared/competition_details.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class PlayStationPlayersList extends StatefulWidget {
  final playstationPlayer;
  final String? searchTxt;
  final bool isBusy;

  const PlayStationPlayersList(
      {super.key,
      this.searchTxt,
      required this.playstationPlayer,
      required this.isBusy});

  @override
  State<PlayStationPlayersList> createState() => _PlayStationPlayersListState();
}

class _PlayStationPlayersListState extends State<PlayStationPlayersList> {
  List filterList = [];
  @override
  void initState() {
    super.initState();
    for (var item in widget.playstationPlayer!) {
      if (item.isAvailable == widget.isBusy) {
        filterList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (BuildContext context, int index) {
        return Visibility(
          visible: widget.searchTxt!.isNotEmpty
              ? index == widget.searchTxt!.length
              : true,
          child: PlayStationPlayerItem(
            player: filterList[index],
            isBusy: widget.isBusy,
          ),
        );
      },
    );
  }
}

class PlayStationPlayerItem extends StatefulWidget {
  final player;
  final bool isBusy;

  const PlayStationPlayerItem(
      {super.key, required this.player, required this.isBusy});

  @override
  State<PlayStationPlayerItem> createState() => _PlayStationPlayerItemState();
}

class _PlayStationPlayerItemState extends State<PlayStationPlayerItem> {
  var dateTime;

  @override
  Widget build(BuildContext context) {
    dateTime =
        DateFormat.yMMMMd(context.locale == Locale('en') ? 'en_US' : "ar")
            .format(DateTime.now().add(Duration(days: 30)));
    String playerName = "${widget.player.name}";
    String compitionTitle = "${widget.player.competitionTitle}";
    bool isJoined = widget.player.isJoined;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(
                10.0), //                 <--- border radius here
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   backgroundColor: primaryColor,
                  //   radius: 40,
                  //   backgroundImage:
                  //       NetworkImage("${widget.player.imageProfile}"),
                  // ),
                  SizedBox(width: MediaQuery.of(context).size.width / 20),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          //   playerName,
                          compitionTitle,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Game Type: ${widget.player.gameType}",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Total Players: ${widget.player.totalPlayers}",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Min Players: ${widget.player.minPlayers.toString()}",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Max Players: ${widget.player.maxPlayers.toString()}",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Total Teams: ${widget.player.totalTeams.toString()}",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "startDate: $dateTime",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Duration : 30 Day",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // 3 days
                        // SizedBox(height: 10),
                        // Text(
                        //   "Count${widget.player.country} - ${widget.player.city}",
                        //   softWrap: true,
                        //   style: TextStyle(
                        //       color: Colors.grey,
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.w500),
                        // ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: widget.isBusy,
                    child: TxtButton(
                      color: darkBlackColor,
                      text: "Joined Competition",
                      borderRadius: 10,
                      horizontalPadding: 30,
                      verticalPadding: 10,
                      onPressed: () {},
                    ),
                  ),
                  Visibility(
                    visible: !widget.isBusy,
                    child: TxtButton(
                      color: isJoined == false ? primaryColor : darkBlackColor,
                      text: isJoined == true ? "Joined" : "Join Competition",
                      borderRadius: 10,
                      horizontalPadding: 30,
                      verticalPadding: 10,
                      onPressed: () {
                        if (isJoined == false) {
                          showPlayWithAlertDialog(context,
                              widget.player.competitionTitle, playerName, () {
                            setState(() {
                              isJoined = !isJoined;
                              widget.player.isJoined = !widget.player.isJoined;
                            });
                          });
                        }
                      },
                    ),
                  ),
                  TxtButton(
                      color: lightBlackColor,
                      borderColor: primaryColor,
                      text: "More Details",
                      borderRadius: 10,
                      horizontalPadding: 35,
                      verticalPadding: 15,
                      onPressed: () {
                        navigateTo(
                            context,
                            CompetitionDetails(
                                competition: widget.player, history: false));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// play with

showPlayWithAlertDialog(
        context, competitionTitle, playerName, Function changeJoinBtnTitle) =>
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: EdgeInsets.only(top: 15.0),
        title: Text(
          competitionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Icon(
        //   Icons.person,
        //   color: primaryColor,
        //   size: 40,
        // ),
        content: SizedBox(
          height: 60,
          child: Column(
            children: [
              Text(
                "Are you sure that you want to join Competition with $playerName ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TxtButton(
                    color: darkBlackColor,
                    text: "Cancel",
                    borderRadius: 10,
                    horizontalPadding: 35,
                    verticalPadding: 10,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TxtButton(
                    color: primaryColor,
                    text: "Confirm",
                    borderRadius: 10,
                    horizontalPadding: 35,
                    verticalPadding: 10,
                    onPressed: () {
                      showToast(msg: "Request has been sent");
                      Navigator.pop(context);
                      changeJoinBtnTitle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
