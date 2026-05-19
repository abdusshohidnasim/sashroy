
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subTitle;
  final Widget? leadingWidget;
  final List<Widget>? actionWidgets;
  final double height;
  final Color backgroundColor;
  final VoidCallback? onBackPress;
  final bool isleating; 

  const CustomAppBar({
    super.key,
    this.title,
    this.subTitle,
    this.leadingWidget,
    this.actionWidgets,
    this.height = 70,
    this.backgroundColor = Colors.transparent,
    this.onBackPress, 
     this.isleating = false,

  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      elevation: 0,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leadingWidth: 70.w,

      /// Leading Button
      leading: 
        Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: leadingWidget ?? _buildBackButton(context),
          ),
       
      

      titleSpacing: 0,

      /// Title Section
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(
                title!,
                style: TextFontStyle.textStyle12C808080AGSS400,
              ),
            if (subTitle != null) ...[
              UIHelper.verticalSpace(2.h),
              Text(
                subTitle!,
                style: TextFontStyle.textStyle12C808080GSM500,
              ),
            ]
          ],
        ),
      ),

      /// Action Buttons
      actions: actionWidgets,
    );
  }

  /// Default Back Button
  Widget _buildBackButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onBackPress ?? () => Navigator.pop(context),
        child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: AppColors.cFFFFFF,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Assets.icons.leftArrow.path,
              height: 24.w,
              width: 24.w,
              color: AppColors.c1A1A1A,
            )),
      ),
    );
  }
}
