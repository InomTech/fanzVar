import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class SingleClubsTab extends StatefulWidget {
  final singleAwards;
  const SingleClubsTab({this.singleAwards, super.key});

  @override
  State<SingleClubsTab> createState() => _SingleClubsTabState();
}

class _SingleClubsTabState extends State<SingleClubsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlackColor, //darkBlackColor
      ),
      child: ListView(
        children: [
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
                  Text(
                    "Lalega",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          for (var i = 0; i < widget.singleAwards.length; i++)
            singleClub(widget.singleAwards[i]['year'],
                widget.singleAwards[i]['Champoin_name']),
        ],
      ),
    );
  }

  Widget singleClub(String clubName, String year) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: darkBlackColor,
          padding: const EdgeInsets.only(bottom: 1),
          child: Container(
            color: lightBlackColor,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  clubName,
                  style: TextStyle(color: Color(0x9CFBFBFB)),
                ),
                Spacer(flex: 4),
                Text(year, style: TextStyle(color: Color(0x9CFBFBFB))),
              ],
            ),
          ),
        ));
  }
}
