import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/gen/assets.gen.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';


class CommonSucessfullDilog {
  static void show({
    required BuildContext context,
    required VoidCallback onTap,
    required String btnName,
    String? bigtext,
    String? buttomtext,
    double? doneimageheight, 
    double? doneimagewidth,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
              backgroundColor: AppColors.cFFFFFF,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Image.asset(
                      Assets.icons.checkDuotone.path,
                      height: doneimageheight ?? 75.h,
                      width: doneimagewidth ?? 75.w,
                    ),
                    UIHelper.verticalSpace(10.h),
                    Text(
                      bigtext ?? "Password Changed!",
                      style: TextFontStyle.textStyle24C1A1A1ADGSS600,
                    ),
                    UIHelper.verticalSpace(10.h),
                    Text(
                      buttomtext ?? "You can now use your new password to login to your account.",
                      style: TextFontStyle.textStyle16C808080GSR400,
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpace(20.h),
                    CustomButton(
                      onTap: onTap,
                      btnName: btnName,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}