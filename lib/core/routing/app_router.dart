import 'package:flutter/material.dart';
import 'package:shop_app/core/routing/routes.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../../features/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.defaultScreen:
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Center(child: Text('The specefid Screen is not available')),
        );
    }
  }
}
