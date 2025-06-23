import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/blur_container.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/textfields.dart';
import '../../../core/constants/images.dart';
import '../../../core/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _blurAnimationController;

  @override
  void initState() {
    _blurAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0,
      upperBound: 6,
    );
    super.initState();
    _blurAnimationController.forward();
    _blurAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _blurAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    Images.loginBg,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          BlurContainer(value: _blurAnimationController.value),
          SafeArea(
              child: Form(
                  child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                const Spacer(),
                const Spacer(),
                _buildTitleText(context),
                const Spacer(),
                const PrimaryTextField(
                  hintText: 'الإيميل',
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 24),
                const PrimaryTextField(
                  hintText: 'الرمز',
                  isObscure: true,
                  prefixIcon: CupertinoIcons.padlock,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(),
                      child: const Text(
                        'نسيت الرمز؟',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    )
                  ],
                ),
                const Spacer(),
                AuthButton(
                    text: 'دخول',
                    onPressed: () {
                      //   Navigator.of(context).pushNamed(UserDashboard.id);
                    }),
                const Spacer(),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Cairo',
                      ),
                      children: [
                        TextSpan(
                            text: 'ليس لديك حساب بعد ؟  ',
                            style: TextStyle(
                                fontSize: 17,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                        TextSpan(
                            text: 'دخول',
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(Routes.signUpScreen);
                              }),
                      ]),
                ),
              ],
            ),
          )))
        ],
      ),
    );
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      children: [
        Text(
          'مرحبا',
          softWrap: true,
          style: TextStyle(
              fontSize: 85,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        Text(
          'الدخول الى حسابك',
          softWrap: true,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
