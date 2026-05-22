import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget? tabletView;
  final Widget? desktopView;

  const ResponsiveLayout({
    super.key,
    required this.mobileView,
    this.tabletView,
    this.desktopView,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return desktopView ?? tabletView ?? mobileView;
        }
        if (constraints.maxWidth >= 600) {
          return tabletView ?? mobileView;
        }
        return mobileView;
      },
    );
  }
}
