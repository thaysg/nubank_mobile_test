import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../domain/entities/link_entity.dart';
import 'link_history_card.dart';

class LinkHistorySection extends StatelessWidget {
  final List<LinkEntity> links;
  final VoidCallback onClear;
  final Function(String) onDelete;
  final bool isScrollable;

  const LinkHistorySection({
    super.key,
    required this.links,
    required this.onClear,
    required this.onDelete,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (links.isEmpty) {
      content = const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: EmptyStateWidget(
          icon: Icons.link_off,
          message: AppStrings.historyEmpty,
        ),
      );
      if (!isScrollable) {
        content = Center(child: content);
      }
    } else {
      content = ListView.separated(
        physics: isScrollable
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        shrinkWrap: isScrollable,
        itemCount: links.length,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final link = links[index];
          return LinkHistoryCard(
            link: link,
            onDelete: () => onDelete(link.alias),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: isScrollable ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 22.sp,
                    color: AppColors.primary,
                  ),
                  8.horizontalSpace,
                  Flexible(
                    child: Text(
                      AppStrings.historyTitle,
                      style: AppTextStyles.h2(
                        context,
                      ).copyWith(fontSize: 18.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            if (links.isNotEmpty)
              TextButton(
                onPressed: onClear,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  AppStrings.historyClear,
                  style: AppTextStyles.link(
                    context,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
        16.verticalSpace,
        if (isScrollable)
          content
        else
          Expanded(
            child: content,
          ),
      ],
    );
  }
}
