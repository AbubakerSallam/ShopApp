import 'package:flutter/material.dart';
import 'dart:ui';

class BlurContainer extends StatelessWidget {
  const BlurContainer({super.key, this.value = 0});

  final double value;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: value,
        sigmaY: value,
      ),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
