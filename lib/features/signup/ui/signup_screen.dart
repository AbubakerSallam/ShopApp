import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/components/blur_container.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/social_icon_buttons_row.dart';
import '../../../core/components/textfields.dart';
import '../../../core/constants/images.dart';
import '../../../core/routing/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _blurAnimationController;

  @override
  void initState() {
    _blurAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0,
      upperBound: 45,
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
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              Images.loginBg,
            ),
            fit: BoxFit.cover,
          )),
        ),
        BlurContainer(value: 50 - _blurAnimationController.value),
        SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: double.infinity),
                  const Spacer(),
                  const Spacer(),
                  _buildTitleText(context),
                  const Spacer(),
                  const PrimaryTextField(
                    hintText: 'الاسم الثلاثي',
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 24),
                  const PrimaryTextField(
                    hintText: 'الرمز',
                    isObscure: true,
                    prefixIcon: CupertinoIcons.padlock,
                  ),
                  SizedBox(height: 24),
                  const PrimaryTextField(
                    hintText: 'البريد الالكتروني',
                    prefixIcon: CupertinoIcons.mail_solid,
                  ),
                  SizedBox(height: 24),
                  const PrimaryTextField(
                    hintText: 'الرقم',
                    prefixIcon: CupertinoIcons.phone_fill,
                  ),
                  const Spacer(),
                  AuthButton(
                      text: 'انشاء',
                      onPressed: () {
                        //   Navigator.of(context).pushNamed(UserDashboard.id);
                      }),
                  const Spacer(),
                  // Text('أو التسجيل عبر احد حسابات الميديا',
                  //     style: TextStyle(
                  //         fontSize: 15,
                  //         color: Theme.of(context).colorScheme.onSurface)),
                  //  24.SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        children: [
                          TextSpan(
                              text: ' لديك حساب بالفعل ؟  ',
                              style: TextStyle(
                                  fontSize: 17,
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                          TextSpan(
                              text: 'دخول',
                              style: TextStyle(
                                  fontSize: 17,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.loginScreen);
                                }),
                        ]),
                  ),
                  // const SocialIconButtonsRow(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      children: [
        Text(
          'انشاء حساب',
          softWrap: true,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
