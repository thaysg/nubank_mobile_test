import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_decorated_box.dart';
import '../../domain/entities/link_entity.dart';
import 'link_actions.dart';
import 'link_favicon_avatar.dart';
import 'shortened_link_info.dart';

class LinkHistoryCard extends StatelessWidget {
  final LinkEntity link;
  final VoidCallback onDelete;

  const LinkHistoryCard({
    super.key,
    required this.link,
    required this.onDelete,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: link.shortUrl));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.copySuccess),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openLink() async {
    final url = Uri.parse(link.shortUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDecoratedBox(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          LinkFaviconAvatar(url: link.originalUrl),
          16.horizontalSpace,
          Expanded(child: ShortenedLinkInfo(link: link)),
          LinkActions(
            onCopy: () => _copyToClipboard(context),
            onOpen: _openLink,
          ),
          // Delete button — rendered here since LinkActions handles open/copy only
          IconButton(
            padding: EdgeInsets.all(8.w),
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.delete_outline,
              size: 22.sp,
              color: AppColors.error,
            ),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
