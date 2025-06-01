// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/auth/forget_password/cubit/cubit.dart';
import 'package:fanzhashem/modules/auth/forget_password/cubit/states.dart';
import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/fields_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<ForgetPasswordCubit>(
        create: (context) => ForgetPasswordCubit(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
            listener: (context, state) async {
              if (state is SendEmailSuccess) {
                showToast(
                  msg: LocaleKeys.forgot_pass_screen_reset_link_msg.tr(
                    args: [
                      BlocProvider.of<ForgetPasswordCubit>(context)
                          .emailController
                          .text
                    ],
                  ),
                );

                // "A password reset link has been sent to ${BlocProvider.of<ForgetPasswordCubit>(context).emailController.text}");

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }
            },
            builder: (context, state) => WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context);
                  return false;
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
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      title: Text(LocaleKeys.forgot_pass_screen_reset_txt.tr(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    body: SafeArea(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        },
                        child: Stack(
                          children: [
                            ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                Container(
                                    height: MediaQuery.of(context).size.height,
                                    alignment: Alignment.bottomLeft,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            '${assetImageBaseUrl}ground.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Form(
                                        key: BlocProvider.of<
                                                ForgetPasswordCubit>(context)
                                            .formKey,
                                        child: Column(children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 110.0,
                                                left: 20,
                                                right: 20),
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              LocaleKeys
                                                  .forgot_pass_screen_forgot_msg
                                                  .tr(args: ["\n"]),
                                              // "Enter your email and will send you \ninstructions how to reset it ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 50.0, right: 20, left: 20),
                                            child: TxtField(
                                              controller: BlocProvider.of<
                                                          ForgetPasswordCubit>(
                                                      context)
                                                  .emailController,
                                              hintText: LocaleKeys
                                                  .general_emial_txt
                                                  .tr(),
                                              validator: (value) {
                                                if (value.toString().isEmpty ||
                                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(
                                                            value.toString()) ||
                                                    value == null) {
                                                  return LocaleKeys
                                                      .general_email_msg
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
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                top: height / 15,
                                                left: 0,
                                                right: 0),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  TxtButton(
                                                    color: accentColor,
                                                    text: LocaleKeys
                                                        .forgot_pass_screen_send_txt
                                                        .tr(),
                                                    horizontalPadding: 45,
                                                    verticalPadding: 20,
                                                    onPressed: () async {
                                                      BlocProvider.of<
                                                                  ForgetPasswordCubit>(
                                                              context)
                                                          .sendEmail();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]))),
                              ],
                            ),
                            ShowLoading(
                              isLoading:
                                  BlocProvider.of<ForgetPasswordCubit>(context)
                                      .isLoading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
