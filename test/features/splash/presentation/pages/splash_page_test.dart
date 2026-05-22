import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nubank_mobile_test/features/splash/presentation/pages/splash_page.dart';

void main() {
  testWidgets('SplashPage displays logo', (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
      ],
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp.router(routerConfig: router),
      ),
    );

    expect(find.byType(Image), findsOneWidget);

    // Settle the navigation timer
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Home'), findsOneWidget);
  });
}
