import 'package:flutter/material.dart';

import '../../models/club_profile/club_project_model.dart';
import '../../widgets/shared_widget.dart';
import '../club/club_profile.dart';

class ClubFinishedProjects extends StatefulWidget {
  final List<ClubProjectModel> finishedProjects;

  const ClubFinishedProjects({required this.finishedProjects, super.key});

  @override
  State<ClubFinishedProjects> createState() => _ClubFinishedProjectsState();
}

class _ClubFinishedProjectsState extends State<ClubFinishedProjects> {
  @override
  Widget build(BuildContext context) {
    print(widget.finishedProjects);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Project Name',
            valueStr: widget.finishedProjects[0].projectName,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Project Description',
            valueStr: widget.finishedProjects[0].projectDescription,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Location',
            valueStr: widget.finishedProjects[0].location,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Budgets',
            valueStr: widget.finishedProjects[0].budgets,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Revenue',
            valueStr: widget.finishedProjects[0].revenue,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerListWidget(
            keyStr: 'Consultant',
            valueStr: widget.finishedProjects[0].consultation,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerListWidget(
            keyStr: 'Companies',
            valueStr: widget.finishedProjects[0].companies,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Cost',
            valueStr: widget.finishedProjects[0].cost,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Vacancies Number Of Workers',
            valueStr: widget.finishedProjects[0].vacanciesNumberOfWorkers,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Biding',
            valueStr: widget.finishedProjects[0].bidingDate,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Voting',
            valueStr: widget.finishedProjects[0].voting,
          ),
        ],
      ),
    );
  }
}
