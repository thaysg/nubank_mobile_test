import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.appLogo, width: 40.w, height: 40.w),
            8.horizontalSpace,
            Flexible(
              child: Text(
                AppStrings.homeTitle,
                style: AppTextStyles.h2(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Text(
          AppStrings.homeSubtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
