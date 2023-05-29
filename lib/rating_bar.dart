import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ratingbar/star_count.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final int rating;
  const RatingBar({Key? key, this.starCount = 5, this.rating = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providers = context.watch<StarCountProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(starCount, (index) {
        return GestureDetector(
          onTap: () {
            if (rating == index + 1) {
              debugPrint('equal--> ${starCount - index}');
              // if the user taps the same star that was already selected, deselect it
              providers.updateStarCount(index);
            } else {
              debugPrint('increase--> ${index + 1}');

              // update the rating and star count
              providers.updateStarCount(index + 1);
            }
          },
          child: Icon(
            index < providers.getstarcount ? Icons.star : Icons.star_border,
            size: 30.0,
            color: index < providers.getstarcount ? Colors.red : Colors.black87,
          ),
        );
      }),
    );
  }
}
