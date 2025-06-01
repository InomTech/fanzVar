// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/models/suggested_project_model.dart';
import 'package:fanzhashem/modules/suggested_projects/create_new_project_screen.dart';
import 'package:fanzhashem/modules/suggested_projects/cubit/cubit.dart';
import 'package:fanzhashem/modules/suggested_projects/suggested_project_details.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

var suggestedProjects = [];

class SuggestedProjectScreen extends StatelessWidget {
  const SuggestedProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (BuildContext context) =>
          SuggestedProjectsCubit()..getProjectsFun(),
      child: BlocConsumer<SuggestedProjectsCubit, SuggestedProjectsStates>(
          listener: (context, state) async {
        if (state is GetSuggestedProjectsState) {
          suggestedProjects = state.suggestedProjects;
        }
      }, builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Suggested Projects"),
            centerTitle: true,
            backgroundColor: lightBlackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              navigateTo(context, CreateNewProjectScreen());
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: primaryColor,
                  size: 45,
                ),
                SizedBox(width: 8),
                Text(
                  "New Project",
                  style: TextStyle(
                    color: primaryColor.withOpacity(0.7),
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ///===================== Match List per section ======================
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: suggestedProjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      var projects = suggestedProjects[index]["projects_list"];

                      var projectsList = projects
                          .map((e) => SuggestedProjectModel.fromJson(e))
                          .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                suggestedProjects[index]["category_name"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: projectsList.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext ctx, int i) {
                              var projectElement = projectsList[i];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProjectWidget(
                                  commentsNum: projectElement.commentsNum,
                                  likesNum: projectElement.likesMun,
                                  projectName: projectElement.projectName,
                                  projectStatus: projectElement.projectStatus,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String projectName, projectStatus, likesNum, commentsNum;
  const ProjectWidget(
      {required this.projectName,
      required this.projectStatus,
      required this.likesNum,
      required this.commentsNum,
      super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SuggestedProjectsCubit()..getProjectsFun(),
      child: BlocConsumer<SuggestedProjectsCubit, SuggestedProjectsStates>(
          listener: (context, state) async {
        if (state is GetSuggestedProjectsState) {
          suggestedProjects = state.suggestedProjects;
        }
      }, builder: (context, state) {
        var cubit = SuggestedProjectsCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: lightBlackColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 0.5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      SuggestedProjectDetailsScreen(
                          projectStatus: projectStatus,
                          projectDesc: "jf",
                          projectName: projectName,
                          likesNum: likesNum,
                          commentsNum: commentsNum));
                },
                child: Text(
                  projectName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.FavourtFillColor();
                    },
                    child: Icon(Icons.favorite,
                        color: cubit.isFavourt ? Colors.white : primaryColor),
                  ),
                  SizedBox(width: 4),
                  Text(likesNum),
                  SizedBox(width: 20),
                  Image.asset("${assetImageBaseUrl}Group 10436.png"),
                  SizedBox(width: 4),
                  Text(commentsNum),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        cubit.Voted();
                      },
                      // child: Icon(Icons.favorite,
                      //     color: cubit.isVoted
                      //         ? Colors.white
                      //         : primaryColor),
                      child: cubit.isVoted
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.21],
                                  colors: [
                                    Color(0x66CDA250),
                                    Color(0x59CDA250),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Text(
                                  "vote",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [
                                      0.0,
                                      0.21
                                    ],
                                    colors: [
                                      Colors.grey.withOpacity(0.5),
                                      Colors.grey.withOpacity(0.2),
                                    ]),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Text(
                                  "voted",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
