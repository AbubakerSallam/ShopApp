import 'package:flutter/material.dart';

import '../theming/colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.rating}) : super(key: key);
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
