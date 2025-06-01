import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class PublicClubsTab extends StatefulWidget {
  final publicAwards;
  const PublicClubsTab({this.publicAwards, super.key});

  @override
  State<PublicClubsTab> createState() => _PublicClubsTabState();
}

class _PublicClubsTabState extends State<PublicClubsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlackColor,
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
                  Spacer(flex: 1),
                  Text(
                    "Championship",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "Prize",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          for (var i = 0; i < widget.publicAwards.length; i++)
            publicClubWidget(
                widget.publicAwards[i]['year'],
                widget.publicAwards[i]['Champoin_name'],
                widget.publicAwards[i]['prize']),
        ],
      ),
    );
  }

  Widget publicClubWidget(String clubName, String year, String prize) {
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
                Spacer(flex: 4),
                Text(prize, style: TextStyle(color: Color(0x9CFBFBFB))),
                // Spacer(flex: 4),
              ],
            ),
          ),
        ));
  }
}
