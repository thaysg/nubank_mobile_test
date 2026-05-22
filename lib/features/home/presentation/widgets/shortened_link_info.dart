import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_utils.dart';
import '../../domain/entities/link_entity.dart';

class ShortenedLinkInfo extends StatelessWidget {
  const ShortenedLinkInfo({super.key, required this.link});

  final LinkEntity link;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          UrlUtils.getSiteName(link.originalUrl).toUpperCase(),
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        2.verticalSpace,
        Text(
          link.shortUrl,
          style: AppTextStyles.link(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
