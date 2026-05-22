import 'package:flutter/material.dart';

import '../view_data/home_view_data.dart';
import '../widgets/home_body.dart';

class HomeMobileView extends StatelessWidget {
  final HomeViewData viewData;
  final VoidCallback onClearHistory;
  final Function(String) onDeleteLink;

  const HomeMobileView({
    super.key,
    required this.viewData,
    required this.onClearHistory,
    required this.onDeleteLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: HomeBody(
            viewData: viewData,
            onClearHistory: onClearHistory,
            onDeleteLink: onDeleteLink,
          ),
        ),
      ),
    );
  }
}
