import "package:collection/collection.dart";
import 'package:fanzhashem/models/club_profile/club_matches_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

late Map<String, List<ClubMatchesModel>> mapPerDate;

class FirstTab extends StatelessWidget {
  final List<ClubMatchesModel> clubMatches;
  const FirstTab({required this.clubMatches, super.key});

  @override
  Widget build(BuildContext context) {
    mapPerDate = groupBy(clubMatches, (ClubMatchesModel obj) => obj.date);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(mapPerDate);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: mapPerDate.length,
          itemBuilder: (BuildContext context, int index) {
            String date = mapPerDate.keys.elementAt(index);
            var matchesList = mapPerDate.values.elementAt(index);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: matchesList.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctx, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MatchItem(
                        match: matchesList[i],
                        width: width,
                        height: height,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MatchItem extends StatelessWidget {
  final double width, height;
  final ClubMatchesModel match;

  const MatchItem(
      {required this.width,
      required this.height,
      required this.match,
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
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: width / 3.1,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("$assetImageBaseUrl${match.firstTeamImg}"),
                ),
                const SizedBox(height: 10),
                Text(
                  match.firstTeamName,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width / 4,
            height: height / 7.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    match.time,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  match.score,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width / 3.1,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("$assetImageBaseUrl${match.secondTeamImg}"),
                ),
                const SizedBox(height: 10),
                Text(
                  match.secondTeamName,
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
