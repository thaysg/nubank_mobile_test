import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class LinkShortenerApp extends StatelessWidget {
  const LinkShortenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Nubank Link Shortener',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(context),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
