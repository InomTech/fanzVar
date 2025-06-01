import 'package:fanzhashem/modules/player_profile/puplic_clubs_tab.dart';
import 'package:fanzhashem/modules/player_profile/single_clubs_tab.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class PlayerClubsTab extends StatefulWidget {
  final singleAwards;
  final publicAwards;

  const PlayerClubsTab({this.singleAwards, this.publicAwards, super.key});

  @override
  _PlayerClubsTabState createState() => _PlayerClubsTabState();
}

class _PlayerClubsTabState extends State<PlayerClubsTab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  int _activeIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _scaffoldKey =
    //     new GlobalKey<ScaffoldState>();
    print(widget.publicAwards);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: primaryColor,
              labelColor: Colors.black,
              indicatorColor: primaryColor,
              labelPadding: EdgeInsets.all(5),
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              tabs: [
                Tab(
                  icon: Container(
                    width: width / 3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                    decoration: BoxDecoration(
                      color: _activeIndex == 0 ? primaryColor : Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "single",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  icon: Container(
                    width: width / 3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                    decoration: BoxDecoration(
                      color: _activeIndex == 1 ? primaryColor : Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Public",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleClubsTab(
                    singleAwards: widget.singleAwards,
                  ),
                  PublicClubsTab(publicAwards: widget.publicAwards)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
