import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';

class PaymentConfirmation extends StatefulWidget {
  const PaymentConfirmation({super.key});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: InkWell(
          onTap: () {
            // navigateTo(context, PaymentConfirmation());
          },
          child: Container(
              color: Colors.transparent,
              height: 60,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Container(
                width: 327,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                    child: Text("Proceed to payment",
                        style: TextStyle(color: Colors.black))),
              )),
        ),
        appBar: AppBar(
          title: Text("Payment Confirmation"),
          centerTitle: true,
          backgroundColor: lightBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            // IconButton(
            //   icon: Image.asset("${assetImageBaseUrl}Menu_1_.png", height: 15),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            // SizedBox(width: 10),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(
                      "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rana Adel",
                      style: TextStyle(color: Color(0xff808080)),
                    )
                  ]),
                  Icon(
                    Icons.edit,
                    color: Color(0xFFCDA250),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text(
                  "Phone number:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "20123 456 789",
                  style: TextStyle(color: Color(0xff808080)),
                )
              ]),
              // SizedBox(
              //   height: 10,
              // ),
              ExpansionTile(
                tilePadding: EdgeInsets.all(0),
                title: Row(children: [
                  Text(
                    "Address :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "24abas elaqad, Nacr City, Cairo, Egypt",
                    style: TextStyle(fontSize: 12, color: Color(0xff808080)),
                  )
                ]),
                children: <Widget>[
                  ListTile(
                    title: Text('data'),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Subtotal",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "LE 1040",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Shipping Fee",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "LE 40",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ]),
              Divider(
                color: Colors.grey,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "LE 1080",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ]),
              Divider(
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add New Address:"),
                  SizedBox(
                      width: 190,
                      child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightBlackColor,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(0.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(0.7),
                                  ),
                                  isDense: true))))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ship to Multiple Addresses:"),
                  SizedBox(
                      width: 180,
                      child: Theme(
                          data: Theme.of(context)
                              .copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightBlackColor,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(0.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(0.7),
                                  ),
                                  isDense: true))))
                ],
              ),
            ])));
  }
}
