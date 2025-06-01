import 'package:fanzhashem/modules/champion/champion_match_result_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class ChampionMatches extends StatefulWidget {
  final championMatches, championDetails;
  const ChampionMatches(
      {required this.championMatches,
      required this.championDetails,
      super.key});

  @override
  State<ChampionMatches> createState() => _ChampionMatchesState();
}

class _ChampionMatchesState extends State<ChampionMatches> {
  @override
  Widget build(BuildContext context) {
    var x = widget.championMatches;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: widget.championMatches.length,
        itemBuilder: (BuildContext context, int index) {
          return championMatchWidget(
              match: widget.championMatches[index],
              height: height,
              width: width);
        },
      ),
    );
  }

  Widget championMatchWidget({required match, height, width}) {
    var t1Name = match["FTeamName"];
    var t2Name = match["STeamName"];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0), //
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(
                      10.0), //                 <--- border radius here
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: darkBlackColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width / 4,
                              alignment: Alignment.center,
                              child: Text(
                                match["FTeamName"],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              '${match["FTeamPoints"]} Points',
                              // "STeamPoints"
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8EA2AB),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${match["Date"]}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8EA2AB),
                              ),
                            ),
                            SizedBox(height: 2),
                            InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    ChampionMatchResultScreen(
                                      match: match,
                                      championName:
                                          widget.championDetails["Name"],
                                      isFromGeneralMatches: false,
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: lightBlackColor,
                                  border: Border.all(color: Color(0xFF424242)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                width: 60,
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  match["score"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width / 4,
                              alignment: Alignment.center,
                              child: Text(
                                match["STeamName"],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              '${match["STeamPoints"]} Points',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8EA2AB),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Container(
    //     height: height / 2.5,
    //     child: ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: 5,
    //         itemBuilder: (context, index) {

    //         }),
    //   ),
    // );
  }
}
