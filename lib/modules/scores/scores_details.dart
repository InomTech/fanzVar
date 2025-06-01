import 'package:fanzhashem/modules/matches/matches.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class ScoreDetails extends StatefulWidget {
  const ScoreDetails({super.key});

  @override
  _ScoreDetailsState createState() => _ScoreDetailsState();
}

class _ScoreDetailsState extends State<ScoreDetails>
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
      appBar: appBar(_scaffoldKey, "Score Details", context),
      backgroundColor: lightBlackColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height / 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Colors.grey.withOpacity(0.5),
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
                  padding: const EdgeInsets.all(8.0), child: HeaderWidget()),
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
                  text: 'Yesterday',
                ),
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Tomorrow',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Matches(
                    showAppBar: false,
                  ),
                  Matches(
                    showAppBar: false,
                  ),
                  Matches(
                    showAppBar: false,
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
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Sunday $formattedNowDate",
              style: TextStyle(
                  fontSize: 14,
                  color: darkBlackColor,
                  fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("4 matches",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text("2 competitions",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ]));
  }
}
