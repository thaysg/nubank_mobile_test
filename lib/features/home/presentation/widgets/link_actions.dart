import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class LinkActions extends StatelessWidget {
  const LinkActions({super.key, required this.onCopy, required this.onOpen});

  final VoidCallback onCopy;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.all(8.w),
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.copy_all_outlined,
            size: 22.sp,
            color: AppColors.textPrimary,
          ),
          onPressed: onCopy,
        ),
        4.horizontalSpace,
        IconButton(
          padding: EdgeInsets.all(8.w),
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.open_in_new_outlined,
            size: 22.sp,
            color: AppColors.primary,
          ),
          onPressed: onOpen,
        ),
      ],
    );
  }
}
