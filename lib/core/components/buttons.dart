import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';
import '../theming/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface)),
        SizedBox(
          child: MaterialButton(
            splashColor: CustomColors.customGrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            padding: const EdgeInsets.all(0),
            onPressed: onPressed,
            child: Transform.rotate(
                angle: 4.71239,
                child: LottieBuilder.asset(
                  Images.proceed,
                  height: 80,
                  frameRate: FrameRate(60),
                )),
          ),
        ),
      ],
    );
  }
}

class PrimaryShadowedButton extends StatelessWidget {
  const PrimaryShadowedButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.borderRadius,
      required this.color});

  final Widget child;
  final double borderRadius;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: const RadialGradient(
              colors: [Colors.black54, Colors.black],
              center: Alignment.topLeft,
              radius: 2),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.25),
                offset: const Offset(3, 2),
                spreadRadius: 1,
                blurRadius: 8)
          ]),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(
      {super.key, required this.iconSize, required this.onPressed});

  final double iconSize;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80))),
          backgroundColor: WidgetStateProperty.all(Colors.pink),
          elevation: WidgetStateProperty.all(4),
          shadowColor: WidgetStateProperty.all(Colors.pink)),
      onPressed: onPressed,
      child: Center(
        child: Icon(
          Icons.favorite,
          size: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

class RoundedAddButton extends StatelessWidget {
  const RoundedAddButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: onPressed,
        color: Colors.black,
        child: Center(
          child: Icon(
            FontAwesomeIcons.plus,
            size: 16,
            color: Theme.of(context).colorScheme.surface,
          ),
        ));
  }
}

class BagButton extends StatelessWidget {
  const BagButton({super.key, this.numberOfItemsPurchased = 0});
  final int? numberOfItemsPurchased;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          icon: Image.asset(
            Images.shoppingBag,
            height: 28,
          ),
          onPressed: () {},
        ),
        if (numberOfItemsPurchased != 0)
          Container(
            margin: const EdgeInsets.only(right: 4, top: 8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: CustomColors.darkBlue,
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(child: Text(numberOfItemsPurchased.toString())),
            ),
          ),
      ],
    );
  }
}
