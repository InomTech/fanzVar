// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/payment/payment_screen.dart';
import 'package:fanzhashem/modules/tickets/tickets_details.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class TicketCategoryScreen extends StatefulWidget {
  const TicketCategoryScreen({super.key});

  @override
  State<TicketCategoryScreen> createState() => _TicketCategoryScreenState();
}

class _TicketCategoryScreenState extends State<TicketCategoryScreen> {
  var seatNo = TextEditingController();
  var row = TextEditingController();
  var section = TextEditingController();
  var category = TextEditingController();
  var selectedCategoryIndex = 1;
  var formKey = GlobalKey<FormState>();
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
          Container(
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
                // if (seatNo.text.isNotEmpty &&
                //     category.text.isNotEmpty &&
                //     section.text.isNotEmpty &&
                //     row.text.isNotEmpty) {
                if (formKey.currentState!.validate() == true) {
                  navigateTo(
                      context, PaymentScreen(isNavigationFromTicket: true));
                } else {
                  showToast(msg: "Please enter all feilds");
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        /// =============== Seat No.   ==================
                        CustomTxtFeild(
                          feildTitle: "Seat No.",
                          controller: seatNo,
                          hintTxt: "Number of Seats",
                          isShowHintTxt: true,
                          width: width,
                          height: height,
                          errEpmty: "Seat No. is required",
                        ),

                        /// =============== Row   ==================
                        CustomTxtFeild(
                          feildTitle: "Row",
                          controller: row,
                          hintTxt: "Row",
                          isShowHintTxt: true,
                          width: width,
                          height: height,
                          errEpmty: "Row is required",
                        ),

                        /// ===============  Section   ==================
                        CustomTxtFeild(
                          feildTitle: "Section",
                          controller: section,
                          hintTxt: "Section number",
                          isShowHintTxt: true,
                          width: width,
                          height: height,
                          errEpmty: "Section is required",
                        ),

                        /// =============== Category  ==================
                        CustomTxtFeild(
                          feildTitle: "Category",
                          controller: category,
                          hintTxt: "Select a Category",
                          isShowHintTxt: true,
                          width: width,
                          height: height,
                          errEpmty: "Category is required",
                        ),
                      ],
                    ),
                  ),
                  // ================== Tickets category ======================
                  const SizedBox(height: 5),
                  CategoryTicket(
                    categoryTitle: "Category 1",
                    categoryIndex: 1,
                    height: height,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 1;
                      });
                    },
                    price: "149£",
                    selectedCategoryIndex: selectedCategoryIndex,
                    txt1: "Short Side",
                    txt2: "Any Behind The Goal Seats",
                  ),
                  const SizedBox(height: 5),
                  CategoryTicket(
                    categoryTitle: "Category 2",
                    categoryIndex: 2,
                    height: height,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 2;
                      });
                    },
                    price: "180£",
                    selectedCategoryIndex: selectedCategoryIndex,
                    txt1: "Short Side",
                    txt2: "No Corners",
                  ),
                  const SizedBox(height: 5),
                  CategoryTicket(
                    categoryTitle: "Category 3",
                    categoryIndex: 3,
                    height: height,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 3;
                      });
                    },
                    price: "210£",
                    selectedCategoryIndex: selectedCategoryIndex,
                    txt1: "Long Side Upper",
                    txt2: "Good View Over The Stadium",
                  ),
                  const SizedBox(height: 5),
                  CategoryTicket(
                    categoryTitle: "Category 4",
                    categoryIndex: 4,
                    height: height,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 4;
                      });
                    },
                    price: "270£",
                    selectedCategoryIndex: selectedCategoryIndex,
                    txt1: "Long Side Lower With Excellent View",
                    txt2: "With Drinks Coffee And Tea",
                  ),
                  const SizedBox(height: 5),
                  CategoryTicket(
                    categoryTitle: "VIP",
                    categoryIndex: 5,
                    height: height,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = 5;
                      });
                    },
                    price: "400£",
                    selectedCategoryIndex: selectedCategoryIndex,
                    txt1: "VIP Seats ",
                    txt2: "With Meals",
                  ),
                  SizedBox(height: height / 18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryTicket extends StatelessWidget {
  final Function onTap;
  final double height;
  final int selectedCategoryIndex;
  final int categoryIndex;
  final String categoryTitle, txt1, txt2, price;

  const CategoryTicket(
      {required this.height,
      required this.selectedCategoryIndex,
      required this.categoryIndex,
      required this.onTap,
      required this.categoryTitle,
      required this.txt1,
      required this.txt2,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return // ================== Category 1 ================
        InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height / 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: lightBlackColor,
          border: selectedCategoryIndex == categoryIndex
              ? Border.all(color: primaryColor.withOpacity(0.5))
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  $categoryTitle",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '\u2022',
                        style: TextStyle(color: primaryColor, fontSize: 20),
                      ),
                      SizedBox(width: 8),
                      Text(txt1, style: TextStyle(color: Color(0xff808080))),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\u2022',
                        style: TextStyle(color: primaryColor, fontSize: 20),
                      ),
                      SizedBox(width: 8),
                      Text(txt2, style: TextStyle(color: Color(0xff808080)))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
