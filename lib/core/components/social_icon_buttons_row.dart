import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIconButtonsRow extends StatelessWidget {
  const SocialIconButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.facebookF,
          color: const Color(0xFF4267B2),
          onPressed: () {},
        ),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.twitter,
          color: const Color(0xFF1DA1F2),
          onPressed: () {},
        ),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.googlePlusG,
          color: const Color(0xFFDB4437),
          onPressed: () {},
        ),
        const SizedBox(),
      ],
    );
  }
}

class SocialButtonWithShadow extends StatelessWidget {
  const SocialButtonWithShadow(
      {super.key, required this.icon, required this.color, this.onPressed});

  final Color color;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return 0;
            } else {
              return 8;
            }
          }),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: WidgetStateProperty.all(color),
          shadowColor: WidgetStateProperty.all(color),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
