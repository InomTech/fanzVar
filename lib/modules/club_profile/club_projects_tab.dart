import 'package:fanzhashem/models/club_profile/club_project_model.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import 'club_finished_projects.dart';
import 'club_inprogress_projects.dart';
import 'club_suggested_projects.dart';

class ClubProjectsTab extends StatefulWidget {
  final List<ClubProjectModel> sugesstedProjects;
  final List<ClubProjectModel> inprogressProjects;
  final List<ClubProjectModel> finishedProjects;
  const ClubProjectsTab(
      {required this.finishedProjects,
      required this.inprogressProjects,
      required this.sugesstedProjects,
      super.key});

  @override
  State<ClubProjectsTab> createState() => _ClubProjectsTabState();
}

class _ClubProjectsTabState extends State<ClubProjectsTab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  int _activeIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: 'suggested'),
            Tab(text: 'Inprogrss'),
            Tab(text: 'Finished')
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ClubSugesstedProjects(
                  sugesstedProjects: widget.sugesstedProjects),
              ClubInprogressProjects(
                  inprogressProjects: widget.inprogressProjects),
              ClubFinishedProjects(finishedProjects: widget.finishedProjects),
            ],
          ),
        ),
      ],
    );
  }
}
