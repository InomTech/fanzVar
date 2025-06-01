import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/payment/payment_screen.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../utilities/colors.dart';
import '../../widgets/keyboardoverlay.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  var creditNameController = TextEditingController();
  var creditNumberController = TextEditingController();
  var creditExpiresController = TextEditingController();
  var creditCVVController = TextEditingController();
  bool isSaveDefaultSelected = false;
  var formKey = GlobalKey<FormState>();
  FocusNode numberFocusNode = FocusNode();
  FocusNode numberFocusNode2 = FocusNode();
  FocusNode numberFocusNode3 = FocusNode();

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
    numberFocusNode2.addListener(() {
      bool hasFocus = numberFocusNode2.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
    numberFocusNode3.addListener(() {
      bool hasFocus = numberFocusNode3.hasFocus;
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
    numberFocusNode2.dispose();
    numberFocusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text("Add Payment Method"),
          centerTitle: true,
          backgroundColor: lightBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: Transform.rotate(
              angle: context.locale == Locale('en')
                  ? 180 * math.pi
                  : 180 * math.pi / 180,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Add Credit Card",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name"),
                            SizedBox(height: 6),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  height: height / 16,
                                  width: width / 1.2,
                                  decoration: BoxDecoration(
                                    color: lightBlackColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(14.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 1.2,
                                  child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: creditNameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(14),
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Name is required";
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Credit card number"),
                            SizedBox(height: 6),
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  height: height / 16,
                                  width: width / 1.2,
                                  decoration: BoxDecoration(
                                    color: lightBlackColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(14.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 1.2,
                                  child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: creditNumberController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(14),
                                    ),
                                    focusNode: numberFocusNode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Card Number is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("  Expires"),
                                  SizedBox(height: 6),
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        height: height / 15,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                          color: lightBlackColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 2.5,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: creditExpiresController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.all(14),
                                          ),
                                          focusNode: numberFocusNode2,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Expires is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("   CVV"),
                                  SizedBox(height: 6),
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Container(
                                        height: height / 15,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                          color: lightBlackColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 2.5,
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          controller: creditCVVController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.all(14),
                                          ),
                                          focusNode: numberFocusNode3,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "CVV is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundCheckBox(
                          size: width / 18,
                          isChecked: isSaveDefaultSelected,
                          borderColor: Colors.white,
                          checkedColor: primaryColor,
                          checkedWidget: Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: width / 24,
                            ),
                          ),
                          onTap: (value) {
                            setState(() {
                              isSaveDefaultSelected = value!;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text("save as default"),
                      ],
                    ),
                  ),
                  //////////////////////////////////////////
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.21],
                            colors: [
                              Color(0xD9F9F9F9),
                              Color(0xffCDA250),
                            ],
                          ),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate() == true) {
                              showSuccessAlert(
                                  context, "Your card added successfully");
                            } else {
                              showToast(msg: "Please enter all feilds");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 25),
                            child: Text(
                              " Save ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
