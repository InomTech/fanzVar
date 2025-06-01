// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/modules/create_team/cubit/cubit.dart';
import 'package:fanzhashem/modules/create_team/cubit/states.dart';
import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/dropdown_menu_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({super.key});

  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  @override
  initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<CreateTeamCubit>(
        create: (context) => CreateTeamCubit(),
        child: BlocConsumer<CreateTeamCubit, CreateTeamStates>(
            listener: (context, state) async {
              if (state is SubmitSuccess) {
                showToast(msg: 'Team created successfully');
                navigateTo(context, PageViewScreen());
              }
            },
            builder: (context, state) => WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: SafeArea(
                    child: Scaffold(
                        key: _scaffoldKey,
                        backgroundColor: Colors.black,
                        resizeToAvoidBottomInset: true,
                        appBar: appBar(_scaffoldKey, "Create Team", context),
                        body: SafeArea(
                            child: Center(
                          child: Stack(
                            children: [
                              Form(
                                key: BlocProvider.of<CreateTeamCubit>(context)
                                    .formKey,
                                child: ListView(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<CreateTeamCubit>(
                                                    context)
                                                .nameController,
                                        hintText: "Name",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your name!';
                                          } else if (double.tryParse(value) !=
                                              null) {
                                            return 'Name must be text only';
                                          }
                                        },
                                        prefixIcon: Icons.person,
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.name,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<CreateTeamCubit>(
                                                    context)
                                                .coachController,
                                        hintText: "Coach",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your coach!';
                                          } else if (double.tryParse(value) !=
                                              null) {
                                            return 'Coach must be text only';
                                          }
                                        },
                                        prefixIcon: Icons.person,
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.name,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<CreateTeamCubit>(
                                                    context)
                                                .teamCaptainController,
                                        hintText: "Team Captain",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your team captain!';
                                          } else if (double.tryParse(value) !=
                                              null) {
                                            return 'Team captain must be text only';
                                          }
                                        },
                                        prefixIcon: Icons.person,
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.name,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<CreateTeamCubit>(
                                                    context)
                                                .playerPositionController,
                                        hintText: "Player Position",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your player position!';
                                          } else if (double.tryParse(value) !=
                                              null) {
                                            return 'Player position must be text only';
                                          }
                                        },
                                        prefixIcon: Icons.person,
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.name,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 25.0, right: 20, left: 20),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.0,
                                                horizontal: 15.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0)),
                                              color: lightBlackColor,
                                              border: Border.all(
                                                  color: BlocProvider.of<
                                                                  CreateTeamCubit>(
                                                              context)
                                                          .selectedPlayerError
                                                      ? Colors.red
                                                      : lightBlackColor),
                                            ),
                                            child: DropDownMenuWidget(
                                              hint: 'Choose Player',
                                              items: BlocProvider.of<
                                                      CreateTeamCubit>(context)
                                                  .players,
                                              selectedValue: BlocProvider.of<
                                                      CreateTeamCubit>(context)
                                                  .selectedPlayer,
                                              onChanged: (val) {
                                                BlocProvider.of<
                                                            CreateTeamCubit>(
                                                        context)
                                                    .selectPlayer(
                                                        val.toString());
                                              },
                                            )),
                                        Visibility(
                                          visible:
                                              BlocProvider.of<CreateTeamCubit>(
                                                      context)
                                                  .selectedPlayerError,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 5.0, right: 20, left: 20),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.0,
                                                horizontal: 15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Please select a chosen player!",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 25.0, right: 20, left: 20),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 15.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0)),
                                              color: lightBlackColor,
                                              border: Border.all(
                                                  color: BlocProvider.of<
                                                                  CreateTeamCubit>(
                                                              context)
                                                          .selectedPlayerAgeRangeError
                                                      ? Colors.red
                                                      : lightBlackColor),
                                            ),
                                            child: DropDownMenuWidget(
                                              hint: 'Player Age Range',
                                              items: BlocProvider.of<
                                                      CreateTeamCubit>(context)
                                                  .playerAgeRanges,
                                              selectedValue: BlocProvider.of<
                                                      CreateTeamCubit>(context)
                                                  .selectedPlayerAgeRange,
                                              onChanged: (val) {
                                                BlocProvider.of<
                                                            CreateTeamCubit>(
                                                        context)
                                                    .selectPlayerAgeRange(
                                                        val.toString());
                                              },
                                            )),
                                        Visibility(
                                          visible:
                                              BlocProvider.of<CreateTeamCubit>(
                                                      context)
                                                  .selectedPlayerAgeRangeError,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 5.0, right: 20, left: 20),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.0,
                                                horizontal: 15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Please select a player age range!",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Text("Available Players :  "),
                                      ],
                                    ),
                                    SizedBox(height: 35),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TxtButton(
                                          color: primaryColor,
                                          text: "Invite Player",
                                          horizontalPadding: 40,
                                          verticalPadding: 20,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  _buildPopupDialog(context),
                                            );
                                          },
                                        ),
                                        TxtButton(
                                          color: primaryColor,
                                          text: "Submit",
                                          horizontalPadding: 40,
                                          verticalPadding: 10,
                                          onPressed: () async {
                                            BlocProvider.of<CreateTeamCubit>(
                                                    context)
                                                .submit();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ShowLoading(
                                isLoading:
                                    BlocProvider.of<CreateTeamCubit>(context)
                                        .isLoading,
                              ),
                            ],
                          ),
                        )))))));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          height: 60,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Invite Player",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => showDialog(
                  context: context,
                  builder: (ctx) => Dialog(
                        elevation: 0,
                        backgroundColor: Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 15),
                            Icon(
                              Icons.check_circle,
                              size: 80,
                              color: primaryColor,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Thank you for invite the player",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20.0, left: 12),
                              child: TxtButton(
                                color: primaryColor,
                                text: "Continue",
                                borderRadius: 10,
                                horizontalPadding: 35,
                                verticalPadding: 10,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      )),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: Image(
                    image: AssetImage(
                        "${assetImageBaseUrl}pexels-photo-2379004.png"),
                  ),
                ),
                title: Text("Ali Omer", style: TextStyle(fontSize: 14)),
                subtitle: Text(
                  "@Ali Omer1234",
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
              ),
            ),
          ],
        ),
      ),
      // actions: <Widget>[

      //   Padding(
      //     padding: const EdgeInsets.only(bottom: 20.0, right: 12),
      //     child: TxtButton(
      //       color: primaryColor,
      //       text: LocaleKeys.competitions_screen_apply.tr(),
      //       borderRadius: 10,
      //       horizontalPadding: 35,
      //       verticalPadding: 10,
      //       onPressed: () {
      //         // cubit.applyFilter();
      //       },
      //     ),
      //   ),
      // ],
    );
  }
}
