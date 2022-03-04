import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app_2/utilities/colors.dart';
import 'package:streaming_app_2/utilities/constants.dart';

class TvTile extends StatelessWidget {
  final String image;
  final String category;
  final String name;
  final double rating;

  const TvTile({
    Key? key,
    required this.image,
    required this.category,
    required this.name,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
            child: Image.asset(
              image,
              width: 76,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 4,
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
                initialRating: rating,
                minRating: 0,
                direction: Axis.horizontal,
                itemCount: 5,
                unratedColor: greyColor,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: orangeColor),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
