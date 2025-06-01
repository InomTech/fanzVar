import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingWidget extends StatelessWidget {
  final double initialRating;
  final double itemSize;
  final bool ignoreGestures;
  final void Function(double)? onRatingUpdate;

  const StarRatingWidget(
      {super.key,
      required this.initialRating,
      this.itemSize = 15,
      this.ignoreGestures = true,
      this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: ignoreGestures,
      itemSize: itemSize,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: onRatingUpdate ?? (double value) {},
      //onRatingUpdate: (double value) {},
    );
  }
}
