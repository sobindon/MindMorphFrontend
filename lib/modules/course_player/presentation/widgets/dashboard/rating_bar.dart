import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating, this.fontSize});
  final double rating;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    double textSize = fontSize ?? 13;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rating.toStringAsFixed(1), //rating == 0 ? '0.0' :
          style: TextStyle(color: Colors.amber, fontSize: fontSize),
        ),
        const SizedBox(width: 7),
        ..._generateStarIcons(rating, textSize)
      ],
    );
  }

  Rating _convertToStars(double ratingValue) {
    // Round to the nearest 0.5
    double roundedValue = (ratingValue * 2).round() / 2;

    // Calculate full stars and half stars
    int fullStars = roundedValue.floor();
    int halfStars = (roundedValue - fullStars == 0.5) ? 1 : 0;

    return Rating(fullStars: fullStars, halfStars: halfStars);
  }

  List<Widget> _generateStarIcons(double rating, double iconSize) {
    final starCounts = _convertToStars(rating);
    int emptyStars = 5 - starCounts.fullStars - starCounts.halfStars;

    List<Widget> stars = [];
    for (int i = 0; i < starCounts.fullStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.amber, size: iconSize));
    }
    for (int i = 0; i < starCounts.halfStars; i++) {
      stars.add(Icon(Icons.star_half, color: Colors.amber, size: iconSize));
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.amber, size: iconSize));
    }

    return stars;
  }
}

class Rating {
  int fullStars;
  int halfStars;
  Rating({
    required this.fullStars,
    required this.halfStars,
  });
}
