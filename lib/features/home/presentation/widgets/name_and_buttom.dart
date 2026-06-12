import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class NameAndButtom extends StatelessWidget {
  final String name;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final Color? activeColor;
  final Color? disableColor;

  const NameAndButtom({
    super.key,
    required this.name,
    this.onLeftTap,
    this.onRightTap,
    this.activeColor,
    this.disableColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconActive = activeColor ?? AppColors.c000000;
    final Color iconDisable = disableColor ?? AppColors.cCCCCCC;

    final bool isLeftActive = onLeftTap != null;
    final bool isRightActive = onRightTap != null;

    return Row(
      children: [
        Text(name, style: TextFontStyle.textStyle20C000000Poppins500),
        const Spacer(),
        GestureDetector(
          onTap: onLeftTap,
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withValues(alpha: isLeftActive ? 0.1 : 0.03),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Transform.rotate(
              angle: 3.1415926535,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  Assets.icons.rightIconNoColors.path,
                  color: isLeftActive ? iconActive : iconDisable,
                ),
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(10.w),
        GestureDetector(
          onTap: onRightTap,
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withValues(alpha: isRightActive ? 0.1 : 0.03),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                Assets.icons.rightIconNoColors.path,
                color: isRightActive
                    ? iconActive
                    : iconDisable, 
              ),
            ),
          ),
        )
      ],
    );
  }
}
