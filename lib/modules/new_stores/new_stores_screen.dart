// import 'package:charts_flutter/flutter.dart';
import 'package:fanzhashem/modules/new_stores/deal_item.dart';
import 'package:fanzhashem/modules/new_stores/list_Item.dart';
import 'package:fanzhashem/modules/new_stores/new_store_items_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class NewStoresScreen extends StatefulWidget {
  const NewStoresScreen({super.key});

  @override
  State<NewStoresScreen> createState() => _NewStoresScreenState();
}

class _NewStoresScreenState extends State<NewStoresScreen> {
  List stores = [
    "ss1.PNG",
    "ss4.PNG",
    "ss3.PNG",
    "ss4.PNG",
    "ss5.PNG",
    "ss6.PNG"
  ];

  List<Map<String, dynamic>> listItem = [
    // ignore: equal_elements_in_set
    {
      'id': 1,
      'pg': "laura-chouette-oyDY8kbsvoo-unsplash.png",
      'img': 'add.png',
      "storeName": "Adidas"
    },
    {
      'id': 2,
      'pg': "tom-roberts-dsQEmEfKuFg-unsplash.png",
      'img': 'nik.png',
      "storeName": "Nike"
    },
    {
      'id': 3,
      'pg': "omer-karakus-_291j8tIaW4-unsplash (1).png",
      'img': 'pum.png',
      "storeName": "Puma"
    },
    {
      'id': 4,
      'pg': "group-happy-fans-are-cheering-ir-team-victory_155003-31553.png",
      'img': 'puma.png',
      "storeName": "Tell"
    },
    {
      'id': 5,
      'pg': "breno-assis-r3wawu5fi5q-unsplash.jpg",
      'img':
          'roof-clipart-house-sign-real-estate-investing-the-creative-way-11562888727umoetrcsk8.png',
      "storeName": "Real Estate"
    },
    {
      'id': 6,
      'pg':
          "kisspng-organic-food-fast-food-vegetable-fresh-food-cooking-pan-5ab6d2209b32e8.8274373415219307846357.jpg",
      'img': '615px-Food_Network_New_Logo.png',
      "storeName": "Food"
    },
  ];

  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
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
          IconButton(
            icon: Image.asset("${assetImageBaseUrl}Menu_1_.png", height: 15),
            onPressed: () {
              print("dsfd");
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(
              children: [
                //=================== Stores ========================
                !isGrid
                    ? ListView.builder(
                        shrinkWrap: true,
                        reverse: false,
                        itemCount: listItem.length,
                        padding: EdgeInsets.only(bottom: 5),
                        itemBuilder: ((context, index) {
                          return InkWell(
                              onTap: () {
                                navigateTo(
                                    context,
                                    StoreItemsScreen(
                                        catId: listItem[index]['id'],
                                        storeName: listItem[index]
                                            ['storeName']));
                              },
                              child: ListItem(
                                  bg: listItem[index]['pg'],
                                  img: listItem[index]['img']));
                        }))
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: listItem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext ctx, int index) {
                          return InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  StoreItemsScreen(
                                      catId: listItem[index]['id'],
                                      storeName: listItem[index]['storeName']));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 87,
                                width: 87,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "$assetImageBaseUrl${listItem[index]['pg']}"),
                                      fit: BoxFit.cover,
                                      opacity: 200),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Image.asset(
                                    "$assetImageBaseUrl${listItem[index]['img']}"),
                              ),
                            ),
                          );
                        },
                      ),
                //================= View all Stores =================
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            StoreItemsScreen(
                                catId: 1, storeName: 'All Stores'));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "View All Stores",
                          style: TextStyle(
                              color: primaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //================== Categories =====================
                Row(
                  children: [
                    Text(
                      "Shop by category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    navigateTo(context,
                        StoreItemsScreen(catId: 1, storeName: 'Adidas'));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryItem(
                          title: "Classic", img: "${assetImageBaseUrl}c1.png"),
                      CategoryItem(
                          title: "T-shirts", img: "${assetImageBaseUrl}c2.PNG"),
                      CategoryItem(
                          title: "Bags", img: "${assetImageBaseUrl}c3.PNG"),
                      CategoryItem(
                          title: "Shoes", img: "${assetImageBaseUrl}c4.PNG"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryItem(
                        title: "Bottoms", img: "${assetImageBaseUrl}c5.PNG"),
                    CategoryItem(
                        title: "SweetShirt", img: "${assetImageBaseUrl}c6.PNG"),
                    CategoryItem(
                        title: "BeachWear", img: "${assetImageBaseUrl}c7.png"),
                    CategoryItem(
                        title: "Slippers", img: "${assetImageBaseUrl}c8.PNG"),
                  ],
                ),
                // =========================================
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Deals of the Day",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.9,
                        // mainAxisExtent: 1,
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    reverse: false,
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return DealItem(
                          img: "${assetImageBaseUrl}Seek_adidas.png");
                    })),

                // Row(
                //   children: [
                //     Image.asset(
                //       "${assetImageBaseUrl}deals.PNG",
                //       width: width / 1.08,
                //     ),
                //   ],
                // ),
                SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//==================================================================

//==================================================================

class CategoryItem extends StatelessWidget {
  final String img, title;
  const CategoryItem({required this.img, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 38,
        backgroundImage: AssetImage(img),
      ),
      SizedBox(height: 5),
      Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
      ),
    ]);
  }
}
