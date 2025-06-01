import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class StoreWidget extends StatelessWidget {
  final String storeName;
  final String storeImage;
  final int numOfBranches;
  final int numOfProducts;
  final int numOfReviews;
  final double storeRating;
  final bool isSelected;

  const StoreWidget(
      {super.key,
      required this.storeName,
      required this.storeImage,
      required this.numOfBranches,
      required this.numOfProducts,
      required this.storeRating,
      required this.numOfReviews,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
        width: width / 1.5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: darkBlackColor,
          border:
              Border.all(color: isSelected ? primaryColor : lightBlackColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              storeName,
              softWrap: true,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Flexible(
                  //       child: Text(numOfBranches.toString(),
                  //         softWrap: true,
                  //         style:
                  //         TextStyle(fontSize: 12,color: Colors.white,
                  //             fontWeight: FontWeight.bold),),
                  //     ),
                  //     SizedBox(width: 5,),
                  //     Text("branch",
                  //       softWrap: true,
                  //       style:
                  //       TextStyle(fontSize: 10,
                  //           color: Colors.grey,fontWeight: FontWeight.normal),),
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 5,),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Flexible(
                  //       child: Text(numOfProducts.toString(),
                  //         softWrap: true,
                  //         style:
                  //         TextStyle(fontSize: 12,color: Colors.white,
                  //             fontWeight: FontWeight.bold),),
                  //     ),
                  //     SizedBox(width: 5,),
                  //     Text("product",
                  //       softWrap: true,
                  //       style:
                  //       TextStyle(fontSize: 10,
                  //           color: Colors.grey,fontWeight: FontWeight.normal),),
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 5,),
                  //
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Flexible(
                  //       child: Text(numOfReviews.toString(),
                  //         softWrap: true,
                  //         style:
                  //         TextStyle(fontSize: 12,color: Colors.white,
                  //             fontWeight: FontWeight.bold),),
                  //     ),
                  //     SizedBox(width: 5,),
                  //     Text("review",
                  //       softWrap: true,
                  //       style:
                  //       TextStyle(fontSize: 10,
                  //           color: Colors.grey,fontWeight: FontWeight.normal),),
                  //   ],
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: StarRatingWidget(
                      initialRating: 4,
                      itemSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            //trailing: Icon(Icons.reviews_rounded,color: Colors.white,size: 30,),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(storeImage),
              //backgroundImage: AssetImage("assets/images/saib.png"),
            ),
          ),
        ));
  }
}
