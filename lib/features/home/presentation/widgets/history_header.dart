import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/link_entity.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({super.key, required this.links, required this.onClear});

  final List<LinkEntity> links;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time, size: 22.sp, color: AppColors.primary),
              8.horizontalSpace,
              Flexible(
                child: Text(
                  AppStrings.historyTitle,
                  style: AppTextStyles.bodyMedium(context),
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
    );
  }
}
