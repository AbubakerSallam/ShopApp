import 'package:flutter/material.dart';
import 'package:shop_app/core/routing/routes.dart';
import 'package:shop_app/features/dashboard/ui/bottom_nav.dart';
import 'package:shop_app/features/home/ui/home_screen.dart';
import 'package:shop_app/features/models/product.dart';
import 'package:shop_app/features/product/ui/product_page.dart';
import 'package:shop_app/features/profile/ui/profile_screen.dart';

import '../../features/login/ui/login_screen.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../../features/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

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
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => UserDashboard(),
        );
      case Routes.userProfile:
        return MaterialPageRoute(
          builder: (_) => UserProfileScreen(),
        );
      case Routes.productPage:
        return MaterialPageRoute(
          builder: (_) => ProductPage(
            product: arguments as Product,
          ),
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
