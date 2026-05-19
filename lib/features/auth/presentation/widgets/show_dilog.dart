import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class SucessfullShowDilog {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Timer(const Duration(seconds: 3), () {

         
          NavigationService.navigateToReplacement(
              Routes.loginScreen);
            
        });
        return ClipRRect(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Dialog(
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                backgroundColor: AppColors.c000000.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                          color: AppColors.cFFFFFF.withValues(alpha: 0.2)),
                    ),
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: 48.h,
                                right: 40.w,
                                left: 40.w,
                                bottom: 24.h),
                            child: Column(
                              children: [
                               
                                UIHelper.verticalSpace(12.h),
                                Text(
                                  "Property Listed",
                                  style: TextFontStyle
                                      .textStyle12C808080AGSS400,
                                ),
                                Text(
                                  "Successfully",
                                  style: TextFontStyle
                                      .textStyle12C808080AGSS400,
                                ),
                                UIHelper.verticalSpace(6.h),
                                Text(
                                  "AI now analyzing your property",
                                  style:
                                      TextFontStyle.textStyle12C808080AGSS400,
                                )
                              ],
                            )),
                        
                        UIHelper.verticalSpace(16.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
