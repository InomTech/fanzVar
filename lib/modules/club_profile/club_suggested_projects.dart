import 'package:flutter/material.dart';

import '../../models/club_profile/club_project_model.dart';
import '../../widgets/shared_widget.dart';
import '../club/club_profile.dart';

class ClubSugesstedProjects extends StatefulWidget {
  final List<ClubProjectModel> sugesstedProjects;

  const ClubSugesstedProjects({required this.sugesstedProjects, super.key});

  @override
  State<ClubSugesstedProjects> createState() => _ClubSugesstedProjectsState();
}

class _ClubSugesstedProjectsState extends State<ClubSugesstedProjects> {
  @override
  Widget build(BuildContext context) {
    print(widget.sugesstedProjects);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // navigateTo(
          //     context,
          //     SuggestedProjectDetailsScreen(
          //         projectStatus: 'projectStatus',
          //         projectDesc: "jf",
          //         projectName: widget.sugesstedProjects[0].projectName,
          //         likesNum: 'likesNum',
          //         commentsNum: 'commentsNum'));
        },
        child: ListView(
          children: [
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Project Name',
              valueStr: widget.sugesstedProjects[0].projectName,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Project Description',
              valueStr: widget.sugesstedProjects[0].projectDescription,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Location',
              valueStr: widget.sugesstedProjects[0].location,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Budgets',
              valueStr: widget.sugesstedProjects[0].budgets,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Revenue',
              valueStr: widget.sugesstedProjects[0].revenue,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerListWidget(
              keyStr: 'Consultant',
              valueStr: widget.sugesstedProjects[0].consultation,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerListWidget(
              keyStr: 'Companies',
              valueStr: widget.sugesstedProjects[0].companies,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Cost',
              valueStr: widget.sugesstedProjects[0].cost,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Vacancies Number Of Workers',
              valueStr: widget.sugesstedProjects[0].vacanciesNumberOfWorkers,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Biding',
              valueStr: widget.sugesstedProjects[0].bidingDate,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'Voting',
              valueStr: widget.sugesstedProjects[0].voting,
            ),
          ],
        ),
      ),
    );
  }
}
