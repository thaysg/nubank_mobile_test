import 'package:flutter/material.dart';

import '../view_data/home_view_data.dart';
import '../widgets/home_body.dart';

class HomeDesktopView extends StatelessWidget {
  final HomeViewData viewData;
  final VoidCallback onClearHistory;
  final Function(String) onDeleteLink;

  const HomeDesktopView({
    super.key,
    required this.viewData,
    required this.onClearHistory,
    required this.onDeleteLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 48),
            child: HomeBody(
              viewData: viewData,
              onClearHistory: onClearHistory,
              onDeleteLink: onDeleteLink,
              isScrollable: true,
            ),
          ),
        ),
      ),
    );
  }
}
