import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/shop_app.dart';

import 'core/databases/cache/cache_helper.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  CacheHelper().init();
  runApp(ShopApp(
    appRouter: AppRouter(),
  ));
}
