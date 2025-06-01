// ignore_for_file: must_be_immutable, unused_field

import 'package:fanzhashem/modules/new_stores/cubit/cubit.dart';
import 'package:fanzhashem/modules/new_stores/cubit/state.dart';
import 'package:fanzhashem/modules/new_stores/deal_item.dart';
import 'package:fanzhashem/modules/new_stores/store_item_details_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreItemsScreen extends StatefulWidget {
  final String storeName;
  int? catId;
  StoreItemsScreen({required this.storeName, this.catId, super.key});

  @override
  State<StoreItemsScreen> createState() => _StoreItemsScreenState();
}

class _StoreItemsScreenState extends State<StoreItemsScreen> {
  bool isGrid = true;
  late double _ratingValue;
  bool isFavourt = true;

  List<Map<String, dynamic>> items = [
    {"catId": 1, "image": "Seek_adidas.png", "price": "20"},
    {"catId": 1, "image": "adidas-shoes-1.png", "price": "25"},
    {"catId": 1, "image": "adidas-shoes.png", "price": "30"},
    {"catId": 2, "image": "nika-shose.jpg", "price": "35"},
    {"catId": 2, "image": "nika-shose1.jpeg", "price": "40"},
    {"catId": 3, "image": "i1.png", "price": "45"},
    {"catId": 4, "image": "i1.png", "price": "30"},
    {"catId": 5, "image": "home2.jpeg", "price": "2120"},
    {"catId": 5, "image": "real-estate-comps-91b8c8.jpg", "price": "232000"},
    {"catId": 6, "image": "club_sandwich_16496_16x9.jpg", "price": "19.9"},
    {"catId": 6, "image": "download.jpeg", "price": "10.5"},
  ];
  List item = [
    "i1.png",
    "i2.png",
    "i3.png",
    "i4.png",
    "i5.png",
    "i1.png",
  ];
  @override
  void initState() {
    setState(() {
      items =
          items.where(((element) => element['catId'] == widget.catId)).toList();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          InkWell(
              onTap: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              child: Icon(Icons.grid_view, color: Colors.white)),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined, color: primaryColor),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (() {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: AlertDialog(
                                    // title: Text('Welcome'),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color(0xFFCDA250)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    content: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    items.sort((a, b) =>
                                                        a['image'].compareTo(
                                                            b['image']));
                                                  });
                                                  Navigator.pop(context, true);
                                                },
                                                child: Text(
                                                  "Ascending",
                                                  style: TextStyle(
                                                      color: Color(0xFFCDA250)),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    items.sort((a, b) =>
                                                        b['image'].compareTo(
                                                            a['image']));
                                                  });
                                                  Navigator.pop(context, true);
                                                },
                                                child: Text(
                                                  "Descending",
                                                  style: TextStyle(
                                                      color: Color(0xFFCDA250)),
                                                )),
                                          ],
                                        ))),
                              );
                            },
                          );
                        }),
                        child: IconText(txt: "Sort")),
                    IconText(txt: "Category"),
                  ],
                ),
                Row(
                  children: [
                    IconText(
                      txt: "Filter",
                      isFilter: true,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 4),
            //==============================
            isGrid
                ? ListView.builder(
                    shrinkWrap: true,
                    reverse: false,
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return StoreItem(
                          price: items[index]['price'],
                          onTap: () {
                            navigateTo(
                                context,
                                StoreItemDetailsScreen(
                                  storeName: widget.storeName,
                                ));
                          },
                          img: assetImageBaseUrl + items[index]['image']);
                    }))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.9,
                        // mainAxisExtent: 1,
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    reverse: false,
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return DealItem(
                          price: items[index]['price'],
                          img: assetImageBaseUrl + items[index]['image']);
                    })),

            SizedBox(height: 5),
            // StoreItem(img: "${assetImageBaseUrl}i2.png"),
            // StoreItem(img: "${assetImageBaseUrl}i3.png"),
          ],
        ),
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  final String img;
  Function onTap;
  Function? delete;
  Function? add;
  dynamic price;
  int number;
  Function? remove;
  bool isCheckOut;
  StoreItem({
    required this.img,
    required this.onTap,
    this.add,
    this.remove,
    this.number = 1,
    this.price = "100",
    this.delete,
    this.isCheckOut = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
        create: (BuildContext context) => NewsStoresCubit(),
        child: BlocConsumer<NewsStoresCubit, NewsStoresStates>(
            listener: (context, state) => {},
            builder: (context, state) {
              var cubit = NewsStoresCubit.get(context);

              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: Container(
                      height: hieght / 6,
                      decoration: BoxDecoration(
                        color: lightBlackColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: width / 3,
                            height: hieght / 6,
                            // child: Text("img"),
                            // color: Colors.red,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(img),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Adidas Odyssey react',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '   \$' + price,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              isCheckOut
                                  ? Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: (() {
                                                    add!();
                                                  }),
                                                  child: Container(
                                                    width: 29,
                                                    height: 29,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF2E2E2E),
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFF707070)),
                                                      // borderRadius:
                                                      //     BorderRadius.circular(50),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFCDA250)),
                                                    )),
                                                  )),
                                              Container(
                                                width: 50,
                                                height: 29,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2E2E2E),
                                                  border: Border.all(
                                                      color: Color(0xFF707070)),
                                                  // borderRadius:
                                                  //     BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                        number.toString())),
                                              ),
                                              InkWell(
                                                  onTap: (() {
                                                    remove!();
                                                  }),
                                                  child: Container(
                                                      width: 29,
                                                      height: 29,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF2E2E2E),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xFF707070)),
                                                        // borderRadius:
                                                        //     BorderRadius.circular(50),
                                                      ),
                                                      child: Center(
                                                          child: Text("-",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xFFCDA250)))))),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 70,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                delete!();
                                              },
                                              child: Icon(Icons.delete_outline,
                                                  color: Color(0xFFCDA250)))
                                        ],
                                      ))
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 13.0),
                                      child: RatingBar(
                                          initialRating: 0,
                                          direction: Axis.horizontal,
                                          itemSize: 18,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: const Icon(Icons.star,
                                                  color: Colors.orange),
                                              half: const Icon(
                                                Icons.star_half,
                                                color: Colors.orange,
                                              ),
                                              empty: const Icon(
                                                Icons.star_outline,
                                                color: Colors.orange,
                                              )),
                                          onRatingUpdate: (value) {
                                            cubit.onRateingUpdate(value);
                                          }),
                                    ),
                            ],
                          ),
                          Spacer(),
                          if (!isCheckOut)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cubit.FavourtFillColor();
                                    },
                                    child: Icon(Icons.favorite,
                                        color: cubit.isFavourt
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                  Row(
                                    children: [
                                      cubit.counter == 0
                                          ? Text("")
                                          : Text(cubit.counter.toString()),
                                      InkWell(
                                          onTap: () {
                                            cubit.addToCard();
                                          },
                                          child: Icon(
                                              Icons.add_shopping_cart_rounded,
                                              color: primaryColor)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ));
            }));
  }
}

class IconText extends StatelessWidget {
  final bool isFilter;
  final String txt;
  const IconText({required this.txt, this.isFilter = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isFilter == false
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              children: [
                Text(
                  txt,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 3),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
          )
        : Row(
            children: [
              Icon(Icons.filter_alt_rounded, color: primaryColor),
              SizedBox(width: 3),
              Text(
                "Filter",
                style: TextStyle(color: Colors.white),
              )
            ],
          );
  }
}
