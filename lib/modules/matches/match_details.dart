import 'package:fanzhashem/modules/shared/competition_details_widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatefulWidget {
  final String firstTeamName;
  final String firstTeamScore;
  final String secondTeamName;
  final String secondTeamScore;
  final String matchDate;

  const MatchDetails(
      {super.key,
        required this.firstTeamName,
        required this.firstTeamScore,
        required this.secondTeamName,
        required this.secondTeamScore,
        required this.matchDate});

  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  List<String> galleryImages = [
    "${assetImageBaseUrl}img.png",
    "${assetImageBaseUrl}img.png",
    "${assetImageBaseUrl}img.png",
    "${assetImageBaseUrl}img.png",
    "${assetImageBaseUrl}img.png",
    "${assetImageBaseUrl}img.png"
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: appBar(_scaffoldKey, "Match Details", context),
      backgroundColor: lightBlackColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height / 3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2),
                  ),
                ],
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeaderWidget(
                    firstTeamName: widget.firstTeamName,
                    firstTeamScore: widget.firstTeamScore,
                    secondTeamName: widget.secondTeamName,
                    secondTeamScore: widget.secondTeamScore,
                    matchDate: widget.matchDate),
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Tactics',
                ),
                Tab(
                  text: 'HighLight',
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Details(),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      image: DecorationImage(
                        image: new AssetImage("assets/images/playground.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GalleryGridView(
                    galleryImages: galleryImages,
                    isFullScreen: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String firstTeamName;
  final String firstTeamScore;
  final String secondTeamName;
  final String secondTeamScore;
  final String matchDate;

  const HeaderWidget(
      {super.key,
        required this.firstTeamName,
        required this.firstTeamScore,
        required this.secondTeamName,
        required this.secondTeamScore,
        required this.matchDate});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    '${assetImageBaseUrl}manch.png',
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                SizedBox(
                  width: width / 4,
                  child: Text(firstTeamName,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      )),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(matchDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Text("$firstTeamScore - $secondTeamScore",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ],
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    '${assetImageBaseUrl}byrn.png',
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                SizedBox(
                  width: width / 4,
                  child: Text(secondTeamName,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      )),
                ),
              ],
            ),
          )
        ]));
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
        color: lightBlackColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: ListView(
            children: [
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
              DetailsTxt(
                leftText: "45%",
                rightText: "50%",
                middleText: "fghf",
              ),
            ],
          )),
    );
  }
}

class DetailsTxt extends StatelessWidget {
  final String leftText;
  final String rightText;
  final String middleText;

  const DetailsTxt(
      {super.key,
        required this.leftText,
        required this.rightText,
        required this.middleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(middleText, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(rightText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}
