// ignore_for_file: must_be_immutable

import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DealItem extends StatelessWidget {
  final String img;
  dynamic price;
  DealItem({
    required this.img,
    this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: 200,
        // width: 152,
        // padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            // Container(
            //   height: 164,
            //   width: 152,
            //   decoration: BoxDecoration(
            //     color: lightBlackColor,
            //     borderRadius: BorderRadius.circular(15.0),
            //   ),
            // ),
            Positioned(
              // top: 30,
              child: Image.asset(
                "${assetImageBaseUrl}deal.png",
                width: 49,
                height: 49,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.favorite, color: primaryColor),
            ),

            Positioned.fill(
                top: 9,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(img, width: 150, height: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Column(
                          children: [
                            Text('\$' "$price",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('\$' "120",
                                style: TextStyle(
                                    color: Color(0xFF808080),
                                    decoration: TextDecoration.lineThrough))
                          ],
                        )
                      ],
                    ),
                    Text("Adidas Odyssey react",
                        style: TextStyle(
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                        ))
                  ],
                )),
          ],
        ));
  }
}
