import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:fanzhashem/modules/create_competition/cubit/cubit.dart';
import 'package:fanzhashem/modules/create_competition/cubit/states.dart';
import 'package:fanzhashem/modules/create_competition/second_create_competition.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/keyboardoverlay.dart';

class FirstCreateCompetition extends StatefulWidget {
  const FirstCreateCompetition({super.key});

  @override
  _FirstCreateCompetitionState createState() => _FirstCreateCompetitionState();
}

class _FirstCreateCompetitionState extends State<FirstCreateCompetition> {
  FocusNode numberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    numberFocusNode.addListener(() {
      bool hasFocus = numberFocusNode.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    // Clean up the focus node
    numberFocusNode.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<CreateCompetitionCubit>(
      create: (context) => CreateCompetitionCubit()..getCurrentPosition(),
      child: BlocConsumer<CreateCompetitionCubit, CreateCompetitionStates>(
          listener: (context, state) async {
        if (state is SubmitSuccess) {
          //showToast(msg: 'Competition created successfully');
          navigateTo(context, SecondCreateCompetition());
        }
      }, builder: (context, state) {
        final creatCubit = BlocProvider.of<CreateCompetitionCubit>(context);
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.black,
              resizeToAvoidBottomInset: true,
              appBar: appBar(_scaffoldKey, "Create Competition", context),
              body: SafeArea(
                child: Center(
                  child: Stack(
                    children: [
                      Form(
                        key: creatCubit.firstFormKey,
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 25.0, right: 20, left: 20),
                              child: TxtField(
                                controller: creatCubit.nameController,
                                hintText: "Name",
                                validator: (value) {
                                  if (value.toString().isEmpty ||
                                      value == null) {
                                    return 'Please enter your name!';
                                  } else if (double.tryParse(value) != null) {
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
                                controller: creatCubit.phoneController,
                                hintText: "Phone",
                                focusNode: numberFocusNode,
                                isPhone: true,
                                validator: (value) {
                                  if (value.toString().isEmpty ||
                                      value == null) {
                                    return 'Please enter your phone!';
                                  }
                                },
                                prefixIcon: Icons.call,
                                colorPrefixIcon: primaryColor,
                                keyboardType: TextInputType.phone,
                                onChanged: (String str) {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 25.0, right: 20, left: 20),
                              child: TxtField(
                                controller: creatCubit.durationController,
                                hintText: "Duration",
                                validator: (value) {
                                  if (value.toString().isEmpty ||
                                      value == null) {
                                    return 'Please enter your duration!';
                                  }
                                },
                                prefixIcon: Icons.access_time_rounded,
                                colorPrefixIcon: primaryColor,
                                keyboardType: TextInputType.datetime,
                                onChanged: (String str) {},
                                formatRegx: RegExp("[0-9]"),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 25.0, right: 20, left: 20),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 15.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    // ignore: deprecated_member_use
                                    color: Colors.grey.withOpacity(0.2),
                                    border: Border.all(
                                        color: creatCubit.selectStateError
                                            ? Colors.red
                                            : lightBlackColor),
                                  ),
                                  child: SelectState(
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.white),
                                    onCountryChanged: (value) {
                                      creatCubit.selectState(value,
                                          isCountry: true);
                                    },
                                    onStateChanged: (value) {
                                      creatCubit.selectState(value,
                                          isState: true);
                                    },
                                    onCityChanged: (value) {
                                      creatCubit.selectState(value,
                                          isCity: true);
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: creatCubit.selectStateError,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 5.0, right: 20, left: 20),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.0, horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          // ignore: unnecessary_null_comparison
                                          "Please select a ${creatCubit.countryValue == null ? "country" : BlocProvider.of<CreateCompetitionCubit>(context).stateValue == null ? "state" : "city"}!",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                //navigateTo(context, PickLocationScreen());
                                creatCubit.changePickLoctionzflag();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 25.0, right: 20, left: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0)),
                                  // ignore: deprecated_member_use
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      child: Icon(Icons.location_pin,
                                          color: primaryColor),
                                    ),
                                    Expanded(
                                      child: Text(
                                        creatCubit.permissionAllowed
                                            ? creatCubit.addressTxt
                                            : "Loading ...",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (creatCubit.pickLoctionzflag)
                              SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TxtButton(
                                  color: primaryColor,
                                  text: "Next",
                                  horizontalPadding: 45,
                                  verticalPadding: 10,
                                  onPressed: () async {
                                    BlocProvider.of<CreateCompetitionCubit>(
                                            context)
                                        .next();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ShowLoading(
                        isLoading:
                            BlocProvider.of<CreateCompetitionCubit>(context)
                                .isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
