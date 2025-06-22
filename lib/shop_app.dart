import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class ShopApp extends StatelessWidget {
  final AppRouter appRouter;

  const ShopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'متجر فخامة',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: 'Cairo',
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: false,
            titleTextStyle: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF0F1327),
            primaryContainer: Color(0xFF0F0317),
            secondary: Color(0xFFEFC3FE),
            secondaryContainer: Color(0xFF9F83BE),
            onPrimary: Colors.white,
            surface: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black87,
            error: Colors.red,
            onError: Colors.white,
          ),
        ),
      ),
    );
  }
}
