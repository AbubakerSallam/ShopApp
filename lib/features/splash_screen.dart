import 'package:shop_app/core/constants/images.dart';
import 'package:shop_app/core/helpers/extensions.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/core/theming/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/';
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void _navigateToNext() async {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementNamed(Routes.loginScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customGrey,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, val, child) => Material(
            color: CustomColors.halfWhite,
            elevation: 0,
            borderRadius: BorderRadius.circular(500),
            child: Lottie.asset(
              Images.splashAnim,
              frameRate: FrameRate(60),
              width: MediaQuery.of(context).size.width *
                  (double.parse(val.toString()) * 55),
            ),
          ),
        ),
      ),
    );
  }
}
