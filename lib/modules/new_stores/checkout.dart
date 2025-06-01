import 'package:fanzhashem/modules/new_stores/new_store_items_screen.dart';
import 'package:fanzhashem/modules/new_stores/shipping_address.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Map<String, dynamic>> items = [
    {"image": "i1.png", "count": 1},
    {"image": "i1.png", "count": 1}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: InkWell(
          onTap: () {
            navigateTo(context, ShippingAddress());
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
                    child: Text("CHECKOUT (LE 1040) ",
                        style: TextStyle(color: Colors.black))),
              )),
        ),
        appBar: AppBar(
          title: Text("Checkout"),
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
              ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    return StoreItem(
                        isCheckOut: true,
                        number: items[index]['count'],
                        add: () {
                          print(items[index]['count']);
                          setState(() {
                            items[index]['count'] += 1;
                          });
                        },
                        remove: () {
                          if (items[index]['count'] != 1) {
                            setState(() {
                              items[index]['count'] -= 1;
                            });
                          }
                        },
                        delete: () {
                          if (items.length != 1) {
                            setState(() {
                              items.removeAt(index);
                            });
                          }
                        },
                        onTap: () {},
                        img: "$assetImageBaseUrl${items[index]["image"]}");
                  })),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("(LE 1040) ",
                      style: TextStyle(fontSize: 20, color: Color(0xFFCDA250)))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("You might like :"),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return StoreItem(
                        onTap: () {
                          // navigateTo(
                          //     context,
                          //     StoreItemDetailsScreen(
                          //       title: "eee",
                          //     ));
                        },
                        img: "${assetImageBaseUrl}i1.png");
                  }))
            ])));
  }
}
