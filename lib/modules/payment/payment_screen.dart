import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/modules/payment/add_payment_meyhod.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class PaymentScreen extends StatefulWidget {
  final bool isNavigationFromTicket;
  const PaymentScreen({this.isNavigationFromTicket = false, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = "visa";
  int val = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text("Select a card"),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: const Text(
                    '****1123',
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                        selectedPaymentMethod = "visa";
                      });
                    },
                  ),
                  trailing:
                      Image.asset("${assetImageBaseUrl}visa.png", height: 40),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: const Text(
                    '****2345',
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                        selectedPaymentMethod = "Fawry";
                      });
                    },
                  ),
                  trailing:
                      Image.asset("${assetImageBaseUrl}fawry.png", height: 40),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: const Text(
                    'Cash On Delivery',
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  leading: Radio(
                    value: 3,
                    groupValue: val,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                        selectedPaymentMethod = "Cash";
                      });
                    },
                  ),
                  trailing:
                      Image.asset("${assetImageBaseUrl}cash.png", height: 30),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: !widget.isNavigationFromTicket,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        navigateTo(context, AddPaymentMethod());
                      },
                      icon: Image.asset("${assetImageBaseUrl}ic_add.png"),
                      label: Text(
                        "Add Payment Method",
                        style: TextStyle(
                          color: Color(0xFFCDA250),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // if (widget.isNavigationFromTicket == true) {
                        showSuccessAlert(
                            context,
                            widget.isNavigationFromTicket == true
                                ? "Payment completed successfully"
                                : "Payment confirmed successfully");
                        // } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 25),
                        child: Text(
                          widget.isNavigationFromTicket == true
                              ? " pay "
                              : " Confirm ",
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
    );
  }
}

showSuccessAlert(BuildContext context, String msg) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        title: Icon(
          Icons.check_circle_outline,
          color: primaryColor,
          size: 40,
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            msg,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    navigateAndFinish(context, PageViewScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      " Done ",
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
          SizedBox(height: 30),
        ],
      ),
    );
