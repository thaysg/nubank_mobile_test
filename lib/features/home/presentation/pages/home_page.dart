import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/link_history_provider.dart';
import '../providers/shorten_link_provider.dart';
import '../view_data/home_view_data.dart';
import '../views/home_desktop_view.dart';
import '../views/home_mobile_view.dart';
import '../views/home_tablet_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  String _mapFailure(Object error) {
    if (error is! Failure) return AppStrings.errorUnknown;
    return error.when(
      network: () => AppStrings.errorNoInternet,
      serverError: (code) => AppStrings.errorServer(code),
      notFound: () => AppStrings.errorNotFound,
      unknown: () => AppStrings.errorUnknown,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shortenState = ref.watch(shortenLinkProvider);
    final links = ref.watch(linkHistoryProvider);

    final viewData = HomeViewData(
      links: links,
      isLoading: shortenState is AsyncLoading,
    );

    // Handle errors via snackbar
    ref.listen(shortenLinkProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_mapFailure(error)),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    });

    return ResponsiveLayout(
      mobileView: HomeMobileView(
        viewData: viewData,
        onClearHistory: () =>
            ref.read(linkHistoryProvider.notifier).clearHistory(),
        onDeleteLink: (alias) =>
            ref.read(linkHistoryProvider.notifier).removeLink(alias),
      ),
      tabletView: HomeTabletView(
        viewData: viewData,
        onClearHistory: () =>
            ref.read(linkHistoryProvider.notifier).clearHistory(),
        onDeleteLink: (alias) =>
            ref.read(linkHistoryProvider.notifier).removeLink(alias),
      ),
      desktopView: HomeDesktopView(
        viewData: viewData,
        onClearHistory: () =>
            ref.read(linkHistoryProvider.notifier).clearHistory(),
        onDeleteLink: (alias) =>
            ref.read(linkHistoryProvider.notifier).removeLink(alias),
      ),
    );
  }
}
