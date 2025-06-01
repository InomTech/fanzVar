import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class ChampionRanking extends StatefulWidget {
  final championRanking, championDetails;
  const ChampionRanking(
      {required this.championRanking, required this.championDetails, super.key});

  @override
  State<ChampionRanking> createState() => _ChampionRankingState();
}

class _ChampionRankingState extends State<ChampionRanking> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkBlackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8),
        child: groupItem(widget.championRanking[0], width, height),
        // ListView.builder(
        //     itemCount: widget.championRanking.length,
        //     itemBuilder: (BuildContext ctx, int index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: groupItem(widget.championRanking[index], width, height),
        //       );
        //     }),
      ),
    );
  }

  /// ====================== Group Item =============================

  Widget groupItem(group, width, height) {
    List clubs = group["Clubs"];
    return Column(
      // backgroundColor: lightBlackColor,
      // collapsedBackgroundColor: lightBlackColor,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height / 17,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: primaryColor,
              // border: Border.all(color: Color(0xFF424242)),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 3,
                  // color: Colors.red,
                  child: Text(
                    '    CLUB',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 2.6,
                  child: Row(
                    children: [
                      Text('W',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(flex: 2),
                      Text('D',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(flex: 2),
                      Text('  L',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(flex: 2),
                      Text('PTS',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ================= Clubs ======================
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: clubs.length,
              itemBuilder: (BuildContext context, int index) {
                return clubItem(
                    clubs[index]["ClubName"],
                    clubs[index]["ClubID"],
                    clubs[index]["W"],
                    clubs[index]["D"],
                    clubs[index]["L"],
                    clubs[index]["PTS"],
                    index,
                    height,
                    width);
              }),
        ),
      ],
    );
  }

  /// ======================= Club Item ===========================
  Widget clubItem(clubName, clubID, w, d, l, pts, index, height, width) {
    List clubColors = [
      Colors.cyan,
      Colors.red,
      Colors.blue,
      Colors.amber,
      Colors.red,
      Colors.cyan,
      Colors.pink,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.green,
      Colors.cyan,
      Colors.red,
      Colors.blue,
      Colors.amber,
      Colors.red,
      Colors.cyan,
      Colors.pink,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.red
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: SizedBox(
          height: height / 17,
          width: width, // double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: lightBlackColor,
                      border: Border.all(color: Color(0xFF424242)),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 12, top: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: width / 12,
                            // color: Colors.red,   //clubID
                            child: Text('${index + 1}',
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                              width: width / 2.5,
                              child: Text(clubName ?? 'Club Name')),
                          SizedBox(
                              width: width / 10,
                              child:
                                  Text(w ?? '38', textAlign: TextAlign.left)),
                          SizedBox(
                              width: width / 12,
                              // color: Colors.blue,
                              child:
                                  Text(d ?? '0', textAlign: TextAlign.center)),
                          SizedBox(
                              width: width / 11,
                              // color: Colors.red,
                              child:
                                  Text(l ?? '0', textAlign: TextAlign.right)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: height / 15,
                      width: 8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: clubColors[index] ?? Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                    color: lightBlackColor,
                    border: Border.all(color: Color(0xFF424242)),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      pts ?? '24',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   height: height / 15,
//                   width: 15,
//                   alignment: Alignment.center,
//                   decoration: new BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15.0),
//                       topRight: Radius.circular(15.0),
//                       bottomLeft: Radius.circular(15.0),
//                       bottomRight: Radius.circular(15.0), //
//                     ),
//                   ),
//                 ),
//               ),