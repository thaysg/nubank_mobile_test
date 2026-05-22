import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_data/home_view_data.dart';
import 'home_header.dart';
import 'link_history_section.dart';
import 'shorten_input_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.viewData,
    required this.onClearHistory,
    required this.onDeleteLink,
    this.isScrollable = false,
  });

  final HomeViewData viewData;
  final VoidCallback onClearHistory;
  final Function(String) onDeleteLink;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    final historySection = LinkHistorySection(
      links: viewData.links,
      onClear: onClearHistory,
      onDelete: onDeleteLink,
      isScrollable: isScrollable,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: isScrollable ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const HomeHeader(),
        16.verticalSpace,
        const ShortenInputCard(),
        16.verticalSpace,
        if (isScrollable)
          historySection
        else
          Expanded(
            child: historySection,
          ),
      ],
    );
  }
}
