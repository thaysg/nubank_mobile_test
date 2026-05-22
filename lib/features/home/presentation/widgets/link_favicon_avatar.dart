import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/url_utils.dart';

class LinkFaviconAvatar extends StatelessWidget {
  final String url;

  const LinkFaviconAvatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final siteName = UrlUtils.getSiteName(url);
    final firstLetter = siteName.isNotEmpty ? siteName[0].toUpperCase() : 'L';

    final colorIndex = firstLetter.codeUnitAt(0) % AppColors.colorsList.length;
    final backgroundColor = AppColors.colorsList[colorIndex];

    return SizedBox(
      width: 56.h,
      height: 56.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            firstLetter,
            style: TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.w900,
              fontSize: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
