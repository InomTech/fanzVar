import 'package:flutter/material.dart';

import '../../models/club_profile/club_project_model.dart';
import '../../widgets/shared_widget.dart';
import '../club/club_profile.dart';

class ClubInprogressProjects extends StatefulWidget {
  final List<ClubProjectModel> inprogressProjects;

  const ClubInprogressProjects({required this.inprogressProjects, super.key});

  @override
  State<ClubInprogressProjects> createState() => _ClubInprogressProjectsState();
}

class _ClubInprogressProjectsState extends State<ClubInprogressProjects> {
  @override
  Widget build(BuildContext context) {
    print(widget.inprogressProjects);
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
            valueStr: widget.inprogressProjects[0].projectName,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Project Description',
            valueStr: widget.inprogressProjects[0].projectDescription,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Location',
            valueStr: widget.inprogressProjects[0].location,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Budgets',
            valueStr: widget.inprogressProjects[0].budgets,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Revenue',
            valueStr: widget.inprogressProjects[0].revenue,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerListWidget(
            keyStr: 'Consultant',
            valueStr: widget.inprogressProjects[0].consultation,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerListWidget(
            keyStr: 'Companies',
            valueStr: widget.inprogressProjects[0].companies,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Cost',
            valueStr: widget.inprogressProjects[0].cost,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Vacancies Number Of Workers',
            valueStr: widget.inprogressProjects[0].vacanciesNumberOfWorkers,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Biding',
            valueStr: widget.inprogressProjects[0].bidingDate,
          ),
          SizedBox(
            height: height / 30,
          ),
          ContainerWidget(
            keyStr: 'Voting',
            valueStr: widget.inprogressProjects[0].voting,
          ),
        ],
      ),
    );
  }
}
