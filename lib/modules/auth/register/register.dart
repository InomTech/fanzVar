// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/auth/register%20as%20retail/register_as_retail_screen.dart';
import 'package:fanzhashem/modules/auth/register/cubit/cubit.dart';
import 'package:fanzhashem/modules/auth/register/cubit/states.dart';
import 'package:fanzhashem/modules/inro/intro.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/profile_image_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/keyboardoverlay.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Color borderColor = Colors.transparent;
    return BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) async {
              if (state is RegisterSuccess) {
                showToast(msg: LocaleKeys.register_screen_success_msg.tr());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IntroScreen(
                            userName: state.userName,
                          )),
                );
              }
              if (state is ValidateFormState) {
                borderColor = Colors.red;
              }
              if (state is ChangeImageBorderColortobeTranspeternt) {
                borderColor = Colors.transparent;
              }
              if (state is ImagePicked) {
                borderColor = Colors.transparent;
              }
            },
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
                          child: Stack(
                            children: [
                              Form(
                                key: BlocProvider.of<RegisterCubit>(context)
                                    .formKey,
                                child: ListView(
                                  //  Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ProfileImageWidget(
                                          cubit: BlocProvider.of<RegisterCubit>(
                                              context),
                                          onPressed: () {
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .pickImage();
                                          },
                                          borderColor: borderColor,
                                          // BlocProvider.of<RegisterCubit>(
                                          // context)
                                          // .

                                          // BlocProvider.of<RegisterCubit>(
                                          //                 context)
                                          //             .formKey
                                          //             .currentState
                                          //             ?.validate() ==
                                          //         true
                                          //     ? Colors.transparent
                                          //     : Colors.red,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 8.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .phoneController,
                                        hintText: LocaleKeys
                                            .register_screen_phone
                                            .tr(),
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              value == null) {
                                            return LocaleKeys
                                                .register_screen_phone_msg
                                                .tr();
                                          } else if (!(value.length == 11)) {
                                            return LocaleKeys
                                                .register_screen_phone_length_msg
                                                .tr();
                                          } else if (!(value.substring(0, 2) ==
                                              "01")) {
                                            return LocaleKeys
                                                .register_screen_valid_phone_msg
                                                .tr();
                                          }
                                        },
                                        prefixIcon: Icons.local_phone,
                                        keyboardType: TextInputType.phone,
                                        focusNode: numberFocusNode,
                                        isPhone: true,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 8.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .emailController,
                                        hintText:
                                            LocaleKeys.general_emial_txt.tr(),
                                        validator: (value) {
                                          if (value.toString().isEmpty ||
                                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value.toString()) ||
                                              value == null) {
                                            return LocaleKeys.general_email_msg
                                                .tr();
                                          }
                                        },
                                        prefixIcon: Icons.email_outlined,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 8.0, right: 20, left: 20),
                                      child: TxtField(
                                        controller:
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .passwordController,
                                        hintText: LocaleKeys
                                            .general_password_txt
                                            .tr(),
                                        validator: (value) {
                                          if (value.toString().isEmpty) {
                                            return LocaleKeys
                                                .general_password_msg
                                                .tr();
                                          } else if (value.toString().length <
                                              8) {
                                            return LocaleKeys
                                                .register_screen_password_length_msg
                                                .tr();
                                          }
                                        },
                                        obscureText:
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .obscureText,
                                        suffixWidget: GestureDetector(
                                          onTap: BlocProvider.of<RegisterCubit>(
                                                  context)
                                              .togglePassword,
                                          child: BlocProvider.of<RegisterCubit>(
                                                      context)
                                                  .obscureText
                                              ? Icon(
                                                  Icons.visibility_off,
                                                  size: 20.0,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.visibility,
                                                  size: 20.0,
                                                  color: Colors.white,
                                                ),
                                        ),
                                        prefixIcon: Icons.lock_outline_sharp,
                                        keyboardType: TextInputType.text,
                                        onChanged: (String str) {},
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TxtButton(
                                          color: accentColor,
                                          text: LocaleKeys
                                              .register_screen_register
                                              .tr(),
                                          horizontalPadding: 40,
                                          verticalPadding: 10,
                                          txtSize: 15,
                                          onPressed: () async {
                                            BlocProvider.of<RegisterCubit>(
                                                    context)
                                                .registerUser(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterAsRetailScreen()),
                                            );
                                          },
                                          child: Text(
                                            "Register as a retail",
                                            // LocaleKeys.login_screen_new_user.tr(),
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(.5),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ShowLoading(
                                isLoading:
                                    BlocProvider.of<RegisterCubit>(context)
                                        .isLoading,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
