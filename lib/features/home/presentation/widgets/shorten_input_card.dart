import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_decorated_box.dart';
import '../providers/shorten_input_controller_provider.dart';
import '../providers/shorten_link_provider.dart';

class ShortenInputCard extends ConsumerWidget {
  const ShortenInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(shortenInputControllerProvider);
    final shortenState = ref.watch(shortenLinkProvider);
    final isLoading = shortenState is AsyncLoading;

    return CustomDecoratedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: controller,
            hintText: AppStrings.inputHint,
            prefixIcon: Icons.link,
          ),
          16.verticalSpace,
          AppButton(
            label: AppStrings.shortenButton,
            onPressed: isLoading
                ? null
                : () => _handleShorten(context, ref, controller),
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }

  void _handleShorten(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller,
  ) {
    final url = controller.text;
    if (url.isEmpty) return;

    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.errorInvalidUrl),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    // Dismiss keyboard
    FocusScope.of(context).unfocus();

    // Clear input
    controller.clear();

    ref.read(shortenLinkProvider.notifier).shorten(url);
  }
}
