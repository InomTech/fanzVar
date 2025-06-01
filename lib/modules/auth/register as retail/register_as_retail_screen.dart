// ignore_for_file: deprecated_member_use

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:fanzhashem/modules/auth/register/cubit/cubit.dart';
import 'package:fanzhashem/modules/auth/register/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/profile_image_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../login/login.dart';

class RegisterAsRetailScreen extends StatefulWidget {
  const RegisterAsRetailScreen({super.key});

  @override
  State<RegisterAsRetailScreen> createState() => _RegisterAsRetailScreenState();
}

class _RegisterAsRetailScreenState extends State<RegisterAsRetailScreen> {
  var retailFormKey = GlobalKey<FormState>();
  var companyNameController = TextEditingController();
  var recordController = TextEditingController();
  var activityTypeController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPolicyAccepted = false;
  bool isBelongsToClub = false;
  bool isSignUpClicked = false;
  // var companyNameController = TextEditingController();
  // var companyNameController = TextEditingController();
  // var companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) async {},
        builder: (context, state) => WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return true;
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${assetImageBaseUrl}ground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              body: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Center(
                  child: Form(
                    key: retailFormKey,
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileImageWidget(
                                cubit: BlocProvider.of<RegisterCubit>(context),
                                onPressed: () {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .pickImage();
                                }),
                          ],
                        ),
                        // ====================== Company Name ==================
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.0, right: 20, left: 20),
                          child: TxtField(
                            controller: companyNameController,
                            hintText: "Company Name",
                            validator: (value) {
                              if (value.toString().isEmpty || value == null) {
                                return "Company Name is Required";
                              }
                              // else if (double.tryParse(value) != null) {
                              //   return "";
                              // }
                            },
                            prefixIcon: Icons.business,
                            keyboardType: TextInputType.name,
                            onChanged: (String str) {},
                          ),
                        ),
                        // =================== Commerial Record ==================
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.0, right: 20, left: 20),
                          child: TxtField(
                            controller: recordController,
                            hintText: "Commerial Record",
                            validator: (value) {
                              if (value.toString().isEmpty || value == null) {
                                return "Commerial Record is Required";
                              } else if (double.tryParse(value) != null) {
                                return "";
                              }
                            },
                            prefixIcon: Icons.bubble_chart_sharp,
                            keyboardType: TextInputType.text,
                            onChanged: (String str) {},
                          ),
                        ),
                        // ===================== Activity Type ==================
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.0, right: 20, left: 20),
                          child: TxtField(
                            controller: activityTypeController,
                            hintText: "Activity Type",
                            validator: (value) {
                              if (value.toString().isEmpty || value == null) {
                                return "Activity Type is Required";
                              } else if (double.tryParse(value) != null) {
                                return "";
                              }
                            },
                            prefixIcon: Icons.local_activity_outlined,
                            keyboardType: TextInputType.text,
                            onChanged: (String str) {},
                          ),
                        ),
                        // ====================== Password ==================
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.0, right: 20, left: 20),
                          child: TxtField(
                            controller: passwordController,
                            hintText: "Password",
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Password is required";
                              } else if (value.toString().length < 8) {
                                return "";
                              }
                            },
                            prefixIcon: Icons.lock_outline_sharp,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (String str) {},
                          ),
                        ),
                        // ====================== Confirm Password ==================
                        Container(
                          margin:
                              EdgeInsets.only(top: 10.0, right: 20, left: 20),
                          child: TxtField(
                            controller: confirmPasswordController,
                            hintText: "Confirm Password",
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Confirm Password is required";
                              } else if (value.toString().length < 8) {
                                return "";
                              }
                            },
                            prefixIcon: Icons.lock_outline_sharp,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (String str) {},
                          ),
                        ),
                        // ====================== country =====================
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
                                color: Colors.grey.withOpacity(0.2),
                                border: Border.all(
                                    // color: creatCubit.selectStateError
                                    //     ? Colors.red
                                    //     : lightBlackColor),
                                    ),
                              ),
                              child: SelectState(
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                                onCountryChanged: (value) {
                                  RegisterCubit.get(context)
                                      .selectState(value, isCountry: true);
                                },
                                onStateChanged: (value) {
                                  RegisterCubit.get(context)
                                      .selectState(value, isState: true);
                                },
                                onCityChanged: (value) {
                                  RegisterCubit.get(context)
                                      .selectState(value, isCity: true);
                                },
                              ),
                            ),
                            Visibility(
                              visible: false,
                              // creatCubit.selectStateError,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5.0, right: 20, left: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "",
                                      // "Please select a ${creatCubit.countryValue == null ? "country" : BlocProvider.of<CreateCompetitionCubit>(context).stateValue == null ? "state" : "city"}!",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //=================== Terms =====================
                        SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: <Widget>[
                              RoundCheckBox(
                                size: 22,
                                isChecked: isBelongsToClub,
                                borderColor:
                                    Colors.grey, //genieTheme.accentColor,
                                checkedColor: primaryColor,
                                checkedWidget: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                onTap: (bool? val) {
                                  setState(() {
                                    isBelongsToClub = val!;
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Belongs to Club',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        //=================== Terms =====================
                        SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: <Widget>[
                              RoundCheckBox(
                                size: 22,
                                isChecked: isPolicyAccepted,
                                borderColor:
                                    Colors.grey, //genieTheme.accentColor,
                                checkedColor: primaryColor,
                                checkedWidget: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                onTap: (bool? val) {
                                  setState(() {
                                    isPolicyAccepted = val!;
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Terms Agreement',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isSignUpClicked,
                          child: Visibility(
                            visible: isPolicyAccepted == false,
                            // visible: true,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Please accept Terms and conditions",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TxtButton(
                              color: accentColor,
                              text: "Sign Up",
                              horizontalPadding: 35,
                              verticalPadding: 10,
                              txtSize: 15,
                              onPressed: () async {
                                if (retailFormKey.currentState!.validate()) {
                                  showToast(
                                      msg:
                                          "Registration completed successfully");
                                  navigateTo(context, Login());
                                }
                                setState(() {
                                  isSignUpClicked = true;
                                });
                                // BlocProvider.of<RegisterCubit>(context)
                                //     .registerUser(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
