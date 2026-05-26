import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      _HelpCenterOption(
        title: 'Customer Service',
        icon: Image.asset(
          Assets.icons.headphones.path,
          height: 24.h,
          width: 24.w,
        ),
      ),
      _HelpCenterOption(
        title: 'Whatsapp',
        icon: Icon(Icons.chat_bubble_outline,
            size: 22.sp, color: AppColors.c1A1A1A),
      ),
      _HelpCenterOption(
        title: 'Website',
        icon:
            Icon(Icons.language, size: 22.sp, color: AppColors.c1A1A1A),
      ),
      _HelpCenterOption(
        title: 'Facebook',
        icon: Icon(Icons.facebook, size: 22.sp, color: AppColors.c1A1A1A),
      ),
      _HelpCenterOption(
        title: 'Twitter',
        icon:
            Icon(Icons.alternate_email, size: 22.sp, color: AppColors.c1A1A1A),
      ),
      _HelpCenterOption(
        title: 'Instagram',
        icon:
            Icon(Icons.camera_alt_outlined, size: 22.sp, color: AppColors.c1A1A1A),
      ),
    ];

    return CustomScaffold(
      appBar: CustomAppBar(
        height: 50.h,
        title: 'Help Center',
        actionWidgets: [
          GestureDetector(
            onTap: () {
              NavigationService.navigateTo(Routes.notificationScreen);
            },
            child: Image.asset(
              Assets.icons.notification.path,
              height: 24.h,
              width: 24.w,
            ),
          ),
          UIHelper.horizontalSpace(20.w),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              const CustomDivider(),
              UIHelper.verticalSpace(16.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (_, __) => UIHelper.verticalSpace(12.h),
                itemBuilder: (context, index) {
                  final option = options[index];
                  return _HelpCenterTile(option: option);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpCenterOption {
  final String title;
  final Widget icon;

  const _HelpCenterOption({
    required this.title,
    required this.icon,
  });
}

class _HelpCenterTile extends StatelessWidget {
  final _HelpCenterOption option;

  const _HelpCenterTile({required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.cE6E6E6, width: 1.w),
      ),
      child: Row(
        children: [
          option.icon,
          UIHelper.horizontalSpace(14.w),
          Expanded(
            child: Text(
              option.title,
              style: TextFontStyle.textStyle14C1A1A1AGSR500,
            ),
          ),
        ],
      ),
    );
  }
}
