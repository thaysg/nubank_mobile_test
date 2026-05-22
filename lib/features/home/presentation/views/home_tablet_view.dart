import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../view_data/home_view_data.dart';
import '../widgets/home_body.dart';

class HomeTabletView extends StatelessWidget {
  final HomeViewData viewData;
  final VoidCallback onClearHistory;
  final Function(String) onDeleteLink;

  const HomeTabletView({
    super.key,
    required this.viewData,
    required this.onClearHistory,
    required this.onDeleteLink,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.isLandscape;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: isLandscape
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: HomeBody(
                        viewData: viewData,
                        onClearHistory: onClearHistory,
                        onDeleteLink: onDeleteLink,
                        isScrollable: true,
                      ),
                    )
                  : HomeBody(
                      viewData: viewData,
                      onClearHistory: onClearHistory,
                      onDeleteLink: onDeleteLink,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
