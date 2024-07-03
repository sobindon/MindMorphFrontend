import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _generateStarIcons(rating),
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

  List<Widget> _generateStarIcons(double rating) {
    final starCounts = _convertToStars(rating);
    int emptyStars = 5 - starCounts.fullStars - starCounts.halfStars;

    List<Widget> stars = [];
    for (int i = 0; i < starCounts.fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber));
    }
    for (int i = 0; i < starCounts.halfStars; i++) {
      stars.add(const Icon(Icons.star_half, color: Colors.amber));
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_border, color: Colors.amber));
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
