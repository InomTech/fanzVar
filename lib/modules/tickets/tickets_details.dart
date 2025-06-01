import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/tickets/ticket_category.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/colors.dart';
import '../../widgets/keyboardoverlay.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  var fName = TextEditingController();
  var lName = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var city = TextEditingController();
  var country = TextEditingController();
  var region = TextEditingController();
  var postCode = TextEditingController();
  var phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket Details"),
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
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///================= Next Btn =============
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 35,
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
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate() == true) {
                    navigateTo(context, TicketCategoryScreen());
                  } else {
                    showToast(msg: "Please enter all feilds");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    " Next ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Payment Details",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        /// =============== First Name   ==================
                        CustomTxtFeild(
                          feildTitle: "First Name",
                          hintTxt: "First Name",
                          isShowHintTxt: true,
                          controller: fName,
                          width: width,
                          height: height,
                          errEpmty: 'First Name is required',
                        ),

                        /// =============== Last Name    ==================
                        CustomTxtFeild(
                          feildTitle: "Last Name",
                          hintTxt: "Last Name",
                          isShowHintTxt: true,
                          controller: lName,
                          width: width,
                          height: height,
                          errEpmty: 'Last Name is required',
                        ),

                        /// ===============   Email      ==================
                        CustomTxtFeild(
                            feildTitle: "Email",
                            hintTxt: "Email",
                            isShowHintTxt: true,
                            controller: email,
                            width: width,
                            height: height,
                            errEpmty: 'Email is required',
                            inputType: TextInputType.emailAddress,
                            isEmailFeild: true),

                        /// =============== Address      ==================
                        CustomTxtFeild(
                          feildTitle: "Address",
                          hintTxt: "Address",
                          isShowHintTxt: true,
                          controller: address,
                          width: width,
                          height: height,
                          errEpmty: 'Address is required',
                        ),

                        /// =============== City         ===================
                        CustomTxtFeild(
                          feildTitle: "City",
                          hintTxt: "City",
                          isShowHintTxt: true,
                          controller: city,
                          width: width,
                          height: height,
                          errEpmty: 'City is required',
                        ),

                        /// =============== Country       ==================
                        CustomTxtFeild(
                          feildTitle: "Country",
                          hintTxt: "Country",
                          isShowHintTxt: true,
                          controller: country,
                          width: width,
                          height: height,
                          errEpmty: 'Country is required',
                        ),

                        /// =============== Region/State  ==================
                        CustomTxtFeild(
                          feildTitle: "Region/State",
                          hintTxt: "Region/State",
                          isShowHintTxt: true,
                          controller: region,
                          width: width,
                          height: height,
                          errEpmty: 'Region is required',
                        ),

                        /// =============== Post Code  =====================
                        CustomTxtFeild(
                          feildTitle: "Postcode",
                          hintTxt: "Postcode",
                          isShowHintTxt: true,
                          controller: postCode,
                          width: width,
                          height: height,
                          errEpmty: 'Postcode is required',
                        ),

                        /// =============== Mobile Phone ===================
                        CustomTxtFeild(
                          feildTitle: "Mobile Phone",
                          hintTxt: "Mobile Phone",
                          isShowHintTxt: true,
                          controller: phone,
                          width: width,
                          height: height,
                          errEpmty: 'Mobile Phone is required',
                          inputType: TextInputType.phone,
                          focusNode: numberFocusNode,
                          isPhone: true,
                        ),
                      ],
                    ),
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

class CustomTxtFeild extends StatelessWidget {
  final double width, height;
  final String feildTitle, hintTxt, errEpmty;
  final bool isShowHintTxt;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isEmailFeild;
  final bool isPhone;
  final focusNode;
  const CustomTxtFeild(
      {required this.width,
      required this.height,
      required this.feildTitle,
      required this.controller,
      this.isShowHintTxt = false,
      this.hintTxt = "",
      required this.errEpmty,
      this.inputType = TextInputType.text,
      this.isPhone = false,
      this.isEmailFeild = false,
      this.focusNode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          SizedBox(
            width: width / 3.4,
            child: Row(
              children: [
                Text(
                  feildTitle,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(" *", style: TextStyle(color: primaryColor)),
              ],
            ),
          ),
          SizedBox(width: 3),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: height / 16,
                width: width / 1.65,
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(
                width: width / 1.65,
                child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller,
                    keyboardType: inputType,
                    focusNode: focusNode,
                    inputFormatters: [
                      if (isPhone == true)
                        FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: isShowHintTxt == true ? hintTxt : "",
                      hintStyle:
                          TextStyle(color: Color(0x99808080), fontSize: 14),
                      errorMaxLines: 3,

                      // errorText: errEpmty,
                      errorStyle: TextStyle(
                        color: Colors.red,
                        backgroundColor: Colors.transparent,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.all(14),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return errEpmty;
                      }
                      if (isEmailFeild) {
                        bool isValidEmail = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3,5}$")
                            .hasMatch(val.trim());
                        if (!isValidEmail) return 'please enter a valid Email';
                      }
                      return null;
                    }),
              ),
            ],
          ),
          // Container(
          //   height: height / 16,
          //   width: width / 1.65,
          //   margin: EdgeInsets.only(top: 25.0, right: 2, left: 2),
          //   decoration: BoxDecoration(
          //     color: lightBlackColor,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(12.0),
          //     ),
          //   ),
          //   child: TextFormField(
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       controller: controller,
          //       decoration: InputDecoration(
          //         hintText: isShowHintTxt == true ? hintTxt : "",
          //         hintStyle: TextStyle(color: Color(0x99808080), fontSize: 14),
          //         errorMaxLines: 3,
          //         // errorText: errEpmty,
          //         errorStyle: TextStyle(
          //           color: Colors.red,
          //           backgroundColor: Colors.transparent,
          //         ),
          //         border: InputBorder.none,
          //         focusedBorder: InputBorder.none,
          //         enabledBorder: InputBorder.none,
          //         errorBorder: InputBorder.none,
          //         disabledBorder: InputBorder.none,
          //         contentPadding: const EdgeInsets.all(14),
          //       ),
          //       validator: (val) {
          //         if (val!.isEmpty) {
          //           return errEpmty;
          //         }
          //         return null;
          //       }),
          // ),
        ],
      ),
    );
  }
}
