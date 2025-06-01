// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/modules/new_stores/new_stores_screen.dart';
import 'package:fanzhashem/modules/voucher/cubit/cubit.dart';
import 'package:fanzhashem/modules/voucher/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  List imgsList = [
    "assets/images/HM.png",
    "assets/images/zara.png",
    "assets/images/voucher.png",
    "assets/images/zara.png",
  ];
  List vouchersList = [
    {
      "img": "assets/images/Group 10505.png",
      "percentage": "10%",
      "day": "7",
      "Hr": "3",
      "Min": "29"
    },
    {
      "img": "assets/images/Group 10498.png",
      "percentage": "12%",
      "day": "9",
      "Hr": "6",
      "Min": "33"
    },
    {
      "img": "assets/images/Group 10496.png",
      "percentage": "30%",
      "day": "2",
      "Hr": "3",
      "Min": "19"
    },
    {
      "img": "assets/images/Group 10495.png",
      "percentage": "20%",
      "day": "1",
      "Hr": "9",
      "Min": "29"
    },
    {
      "img": "assets/images/Group 10506.png",
      "percentage": "50%",
      "day": "7",
      "Hr": "2",
      "Min": "14"
    },
  ];
  List stores = [
    "ss1.PNG",
    "ss4.PNG",
    "ss3.PNG",
    "ss4.PNG",
    "ss5.PNG",
    "ss6.PNG"
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => VoucherCubit()..startSecondsTimer(),
        child: BlocConsumer<VoucherCubit, VoucherStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                        child: Swiper(
                            autoplay: true,
                            itemCount: imgsList.length,
                            itemWidth: MediaQuery.of(context).size.width,
                            itemHeight: MediaQuery.of(context).size.height / 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.colorBurn),
                                    image: AssetImage(imgsList[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 10),
                      //=================== Stores ========================
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: stores.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext ctx, int index) {
                          return InkWell(
                            onTap: () {
                              // if (index == 0) {
                              //   navigateTo(context,
                              //       StoreItemsScreen(storeName: 'Adidas'));
                              // } else if (index == 1) {
                              //   navigateTo(context,
                              //       StoreItemsScreen(storeName: 'Nike'));
                              // } else if (index == 2) {
                              //   navigateTo(context,
                              //       StoreItemsScreen(storeName: 'Puma'));
                              // } else if (index == 3) {
                              //   navigateTo(context,
                              //       StoreItemsScreen(storeName: 'Nike'));
                              // } else if (index == 4) {
                              //   navigateTo(context,
                              //       StoreItemsScreen(storeName: 'Reebook'));
                              // } else if (index == 5) {
                              //   navigateTo(
                              //       context, StoreItemsScreen(storeName: 'NB'));
                              // }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: AssetImage(
                                      "$assetImageBaseUrl${stores[index]}"),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: vouchersList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () =>
                                  navigateTo(context, NewStoresScreen()),
                              //  navigateTo(context,
                              //     Stores(isNavigationFromVoucher: true)),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  color: lightBlackColor,
                                  border: Border.all(color: Color(0xFF424242)),
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          vouchersList[index]["img"],
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: vouchersList[index]
                                                  ["percentage"] ??
                                              "10%",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Text(
                                              'off',
                                              textScaleFactor: 2.0,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset(
                                              "${assetImageBaseUrl}Group 8.png",
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0, right: 3),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12.0),
                                                child: Text(
                                                  "Ends:",
                                                  style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),

                                              ///============= Day
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12.0),
                                                      ),
                                                      border: Border.all(
                                                        color: primaryColor
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        vouchersList[index]
                                                                ["day"] ??
                                                            "7",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Day",
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///============== Hr
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12.0),
                                                      ),
                                                      border: Border.all(
                                                        color: primaryColor
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        vouchersList[index]
                                                            ["Hr"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Hr",
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///=============== MIn
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12.0),
                                                      ),
                                                      border: Border.all(
                                                        color: primaryColor
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        vouchersList[index]
                                                            ["Min"],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    "Min",
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              ///========== Sec
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12.0),
                                                      ),
                                                      border: Border.all(
                                                        color: primaryColor
                                                            .withOpacity(0.4),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        VoucherCubit.get(
                                                                context)
                                                            .sec
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    "Sec",
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
