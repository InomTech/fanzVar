import 'package:fanzhashem/modules/champion/champion_details.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class ChampionSeeAll extends StatefulWidget {
  final championList;
  final String categoryName;

  const ChampionSeeAll(
      {super.key, required this.championList, required this.categoryName});

  @override
  _ChampionSeeAllState createState() => _ChampionSeeAllState();
}

class _ChampionSeeAllState extends State<ChampionSeeAll> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> bodies = ["FIFA"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlackColor,
      appBar: appBar(_scaffoldKey, "${widget.categoryName} Champion", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: widget.championList.length,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: 12 / 9,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: () {
                  navigateTo(
                    context,
                    ChampionDetails(
                      championDetails: widget.championList[index],
                    ),
                  );
                },
                // child: navigationBarBtn("trophy.png",
                //     "${widget.championList[index]['Name']}", false,
                //     isNetworkImg: true,
                //     networkImgURL: widget.championList[index]['Avatar']),
                child: Container(
                  width: width / 3.3,
                  height: height / 7,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: lightBlackColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.championList[index]['Avatar'],
                          width: width / 5,
                          height: height / 16,
                        ),
                        Spacer(),
                        Text(
                          widget.championList[index]['Name'].toString(),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
