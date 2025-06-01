// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/modules/create_competition/cubit/cubit.dart';
import 'package:fanzhashem/modules/create_competition/cubit/states.dart';
import 'package:fanzhashem/modules/create_competition/first_create_competition.dart';
import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/dropdown_menu_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/radio_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCreateCompetition extends StatefulWidget {
  const SecondCreateCompetition({super.key});

  @override
  _SecondCreateCompetitionState createState() =>
      _SecondCreateCompetitionState();
}

class _SecondCreateCompetitionState extends State<SecondCreateCompetition> {
  @override
  initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<CreateCompetitionCubit>(
        create: (context) => CreateCompetitionCubit(),
        child: BlocConsumer<CreateCompetitionCubit, CreateCompetitionStates>(
            listener: (context, state) async {
              if (state is SubmitSuccess) {
                showToast(msg: 'Competition created successfully');
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
                        appBar:
                            appBar(_scaffoldKey, "Create Competition", context),
                        body: SafeArea(
                            child: Center(
                          child: Stack(
                            children: [
                              Form(
                                key: BlocProvider.of<CreateCompetitionCubit>(
                                        context)
                                    .secondFormKey,
                                child: ListView(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller: BlocProvider.of<
                                                CreateCompetitionCubit>(context)
                                            .dueTimeController,
                                        hintText: "Due Time",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your due time!';
                                          }
                                        },
                                        prefixIcon: Icons.access_time_rounded,
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.datetime,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 25.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller: BlocProvider.of<
                                                CreateCompetitionCubit>(context)
                                            .startDateController,
                                        hintText: "Start Date",
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return 'Please enter your start date!';
                                          }
                                        },
                                        prefixIcon: Icons.date_range,
                                        isReadOnly: true,
                                        onTap: () async {
                                          DateTime? datePick =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050),
                                          );

                                          print(datePick);

                                          BlocProvider.of<
                                                      CreateCompetitionCubit>(
                                                  context)
                                              .addStartDate(datePick);
                                        },
                                        colorPrefixIcon: primaryColor,
                                        keyboardType: TextInputType.text,
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
                                                                  CreateCompetitionCubit>(
                                                              context)
                                                          .selectedPlayerError
                                                      ? Colors.red
                                                      : lightBlackColor),
                                            ),
                                            child: DropDownMenuWidget(
                                              hint: 'Choose Player',
                                              items: BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .players,
                                              selectedValue: BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .selectedPlayer,
                                              onChanged: (val) {
                                                BlocProvider.of<
                                                            CreateCompetitionCubit>(
                                                        context)
                                                    .selectPlayer(
                                                        val.toString());
                                              },
                                            )),
                                        Visibility(
                                          visible: BlocProvider.of<
                                                      CreateCompetitionCubit>(
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
                                                                  CreateCompetitionCubit>(
                                                              context)
                                                          .selectedPlayerAgeRangeError
                                                      ? Colors.red
                                                      : lightBlackColor),
                                            ),
                                            child: DropDownMenuWidget(
                                              hint: 'Player Age Range',
                                              items: BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .playerAgeRanges,
                                              selectedValue: BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .selectedPlayerAgeRange,
                                              onChanged: (val) {
                                                BlocProvider.of<
                                                            CreateCompetitionCubit>(
                                                        context)
                                                    .selectPlayerAgeRange(
                                                        val.toString());
                                              },
                                            )),
                                        Visibility(
                                          visible: BlocProvider.of<
                                                      CreateCompetitionCubit>(
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
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 25.0, right: 20, left: 20),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 15.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0)),
                                            //color: lightBlackColor,
                                            border: Border.all(
                                                color: BlocProvider.of<
                                                                CreateCompetitionCubit>(
                                                            context)
                                                        .competitionsTypeError
                                                    ? Colors.red
                                                    : darkBlackColor),
                                          ),
                                          child: RadioWidget(
                                            onSelected: (value) {
                                              BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .selectOption(value,
                                                      isCompetitionType: true);
                                            },
                                            title: 'Competitions Types :',
                                            options: BlocProvider.of<
                                                        CreateCompetitionCubit>(
                                                    context)
                                                .competitionsTypes,
                                            selectedOption: BlocProvider.of<
                                                            CreateCompetitionCubit>(
                                                        context)
                                                    .selectedCompetitionsType ??
                                                "",
                                          ),
                                        ),
                                        Visibility(
                                          visible: BlocProvider.of<
                                                      CreateCompetitionCubit>(
                                                  context)
                                              .competitionsTypeError,
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
                                                  "Please select a competition type!",
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
                                              vertical: 8, horizontal: 15.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0)),
                                            //color: lightBlackColor,
                                            border: Border.all(
                                                color: BlocProvider.of<
                                                                CreateCompetitionCubit>(
                                                            context)
                                                        .haveCameraError
                                                    ? Colors.red
                                                    : darkBlackColor),
                                          ),
                                          child: RadioWidget(
                                            onSelected: (value) {
                                              BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .selectOption(value,
                                                      isHaveCamera: true);
                                            },
                                            title: 'Have A Camera :',
                                            options: BlocProvider.of<
                                                        CreateCompetitionCubit>(
                                                    context)
                                                .haveCamera,
                                            selectedOption: BlocProvider.of<
                                                            CreateCompetitionCubit>(
                                                        context)
                                                    .selectedHaveCamera ??
                                                "",
                                          ),
                                        ),
                                        Visibility(
                                          visible: BlocProvider.of<
                                                      CreateCompetitionCubit>(
                                                  context)
                                              .haveCameraError,
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
                                                  "Please select if have a camera!",
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
                                              vertical: 8, horizontal: 15.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32.0)),
                                            //color: lightBlackColor,
                                            border: Border.all(
                                                color: BlocProvider.of<
                                                                CreateCompetitionCubit>(
                                                            context)
                                                        .haveRefereeError
                                                    ? Colors.red
                                                    : darkBlackColor),
                                          ),
                                          child: RadioWidget(
                                            onSelected: (value) {
                                              BlocProvider.of<
                                                          CreateCompetitionCubit>(
                                                      context)
                                                  .selectOption(value,
                                                      isHaveReferee: true);
                                            },
                                            title: 'Have A Referee :',
                                            options: BlocProvider.of<
                                                        CreateCompetitionCubit>(
                                                    context)
                                                .haveReferee,
                                            selectedOption: BlocProvider.of<
                                                            CreateCompetitionCubit>(
                                                        context)
                                                    .selectedHaveReferee ??
                                                "",
                                          ),
                                        ),
                                        Visibility(
                                          visible: BlocProvider.of<
                                                      CreateCompetitionCubit>(
                                                  context)
                                              .haveRefereeError,
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
                                                  "Please select if have a referee!",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TxtButton(
                                          color: primaryColor,
                                          text: "Previous",
                                          horizontalPadding: 35,
                                          verticalPadding: 10,
                                          txtSize: 16,
                                          onPressed: () async {
                                            navigateTo(context,
                                                FirstCreateCompetition());
                                          },
                                        ),
                                        SizedBox(
                                          width: width / 10,
                                        ),
                                        TxtButton(
                                          color: primaryColor,

                                          text: "Submit",
                                          txtSize: 16,
                                          // text: "Submit".toUpperCase(),
                                          horizontalPadding: 40,
                                          verticalPadding: 10,

                                          onPressed: () async {
                                            BlocProvider.of<
                                                        CreateCompetitionCubit>(
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
                                    BlocProvider.of<CreateCompetitionCubit>(
                                            context)
                                        .isLoading,
                              ),
                            ],
                          ),
                        )))))));
  }
}
