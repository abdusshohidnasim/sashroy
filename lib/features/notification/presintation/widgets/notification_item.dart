import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class NotificationItem extends StatelessWidget {
  final String iconpath;
  final String title;
  final String subtitle;

  const NotificationItem({
    super.key,
    required this.iconpath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 2.0, right: 16.0),
            child:Image.asset(iconpath, height: 24.h, width: 24.w)
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle14C1A1A1AGSS600,
                  maxLines: null,
                ),
              UIHelper.verticalSpace(4.h),
                Text(
                  subtitle,
                  style: TextFontStyle.textStyle12C808080GSR400
                  , maxLines: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
