import 'package:fanzhashem/models/stores_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  final List<ReviewModel> reviews;

  const Reviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReviewItem(
                reviewIndex: index,
                review: reviews[index],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: darkBlackColor,
          size: 30,
        ),
        onPressed: () {
          //navigateTo(context, FirstCreateCompetition());
        },
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  final int reviewIndex;

  const ReviewItem(
      {super.key, required this.review, required this.reviewIndex});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: darkBlackColor,
          border: Border.all(color: lightBlackColor),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              review.reviewerName ?? "",
              softWrap: true,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  review.reviewerComment ?? "",
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                StarRatingWidget(
                  initialRating: double.parse((review.review).toString()),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: accentColor,
              backgroundImage: NetworkImage(review.reviewerImage ?? "")),
        ));
  }
}
