// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'checkout.dart';

class StoreItemDetailsScreen extends StatefulWidget {
  String storeName;
  StoreItemDetailsScreen({this.storeName = "test", super.key});

  @override
  State<StoreItemDetailsScreen> createState() => _StoreItemDetailsScreenState();
}

class _StoreItemDetailsScreenState extends State<StoreItemDetailsScreen> {
  var _current = 0;
  var _currentColor = 0;
  var _currentSize = 0;
  List<int> colors = [0xFFA600B8, 0xFF024DFE, 0xFF242625, 0xFFFFFFFF];
  List<String> sizes = ["XS", "S", "M", "L", "XL", "2XL"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
            child: InkWell(
              onTap: () {
                navigateTo(context, Checkout());
              },
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add to Cart", style: TextStyle(color: Colors.black))
                ]),
              ),
            ),
          )),
      appBar: AppBar(
        title: Text(widget.storeName),
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
            Stack(
              children: [
                Positioned(
                    child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 267.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        onPageChanged: (int index, m) {
                          setState(() {
                            _current = index;
                            print("$_current");
                          });
                        },
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              "${assetImageBaseUrl}i1.png",
                              fit: BoxFit.fill,
                              width: 327,
                              height: 267,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          // homePageHelper.getBanner().length,
                          5,
                          (index) => builtDot(index, _current),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Adidas Odyssey react",
                                style: TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.underline,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("110",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            Text("120",
                                style: TextStyle(
                                    color: Color(0xFF808080),
                                    decoration: TextDecoration.lineThrough))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("color",
                            style: TextStyle(
                              color: Color(0xFFCDA250),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              // homePageHelper.getBanner().length,
                              colors.length,
                              (index) => InkWell(
                                  onTap: (() {
                                    setState(() {
                                      _currentColor = index;
                                    });
                                  }),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    width: _currentColor == index ? 25 : 21,
                                    height: _currentColor == index ? 25 : 21,
                                    decoration: BoxDecoration(
                                      color: Color(colors[index]),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Size",
                            style: TextStyle(
                              color: Color(0xFFCDA250),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              // homePageHelper.getBanner().length,
                              sizes.length,
                              (index) => InkWell(
                                  onTap: (() {
                                    setState(() {
                                      _currentSize = index;
                                    });
                                  }),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    width: 29,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2E2E2E),
                                      border: Border.all(
                                          color: _currentSize == index
                                              ? Color(0xFFCDA250)
                                              : Color(0xFF707070)),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(child: Text(sizes[index])),
                                  )),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet",
                          style: TextStyle(fontSize: 12),
                        )),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reviews (2k)",
                        )),
                    Row(
                      children: [
                        Text(
                          "4.91",
                          style: TextStyle(fontSize: 14),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    ListView.separated(
                      reverse: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(children: [
                            Icon(
                              Icons.person_outline,
                              color: Color(0xFF808080),
                            ),
                            Text("Rana Adel"),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ]),
                          subtitle: Text(
                              "This short is so beautiful and comfortable"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey,
                        );
                      },
                      itemCount: 3,
                    )
                  ],
                ))
              ],
            ),
          ])),
    );
  }
}

AnimatedContainer builtDot(int index, int current) {
  return AnimatedContainer(
    padding: const EdgeInsets.all(3),
    margin: const EdgeInsets.all(3),
    height: 9,
    width: current == index ? 9 : 9,
    decoration: BoxDecoration(
      color: current == index ? Color(0xFFCDA250) : Color(0xFF808080),
      borderRadius: BorderRadius.circular(50),
    ),
    duration: const Duration(milliseconds: 400),
  );
}
