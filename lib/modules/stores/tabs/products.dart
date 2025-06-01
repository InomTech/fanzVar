// ignore_for_file: must_be_immutable, unused_field

import 'dart:async';

import 'package:fanzhashem/models/stores_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/fullScreen_image.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Products extends StatelessWidget {
  final List<ProductModel> products;

  const Products({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductItem(
              productIndex: index,
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final int productIndex;

  ProductItem({super.key, required this.product, required this.productIndex});

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: darkBlackColor,
        border: Border.all(color: lightBlackColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => navigateTo(
              context,
              FullScreenImage(
                imagePath: product.image ?? "",
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                //color: Colors.white,
                color: darkBlackColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                image: DecorationImage(
                  // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4),
                  //     BlendMode.colorBurn),
                  image: NetworkImage(product.image ?? ""),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: darkBlackColor,
                border: Border.all(color: lightBlackColor),
              ),
              child: ListTile(
                title: Text(
                  product.name ?? "",
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.monetization_on,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${product.price} L.E",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.point_of_sale,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${(productIndex + 1) * 2} Point",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
