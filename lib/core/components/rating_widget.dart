import 'package:flutter/material.dart';

import '../theming/colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 18, color: CustomColors.starColor),
        SizedBox(
          width: 3,
        ),
        Text(
          '($rating)',
          style: TextStyle(fontSize: 13),
        )
      ],
    );
  }
}
