import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/constants.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String name;
  final double rating;

  const MovieCard({
    Key? key,
    required this.image,
    required this.name,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: defaultMargin,
      ),
      height: 306,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            child: Image.asset(
              image,
              width: 190,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 4,
          ),
          RatingBar.builder(
            itemSize: 18,
            minRating: 0,
            initialRating: rating,
            itemCount: 5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            unratedColor: greyColor,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: orangeColor,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}
