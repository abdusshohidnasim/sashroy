// lib/widgets/buttons/custom_button.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnName;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? bgColor;
  final Color? borderColor;
  final Color? fontColor;
  final double? height;
  final double? width;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Gradient? gradient;
  final bool showBorder;
  final bool isLoading;
  final MainAxisAlignment mainAxisAlignment;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.textStyle,
    this.borderRadius,
    this.bgColor,
    this.height,
    this.width,
    this.fontColor,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.gradient,
    this.showBorder = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    // Treat the grey color as the disabled state.
    final bool isButtonDisabled = bgColor == AppColors.cCCCCCC;

    final VoidCallback? handleTap =
        (isButtonDisabled || isLoading) ? null : onTap;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: GestureDetector(
          onTap: handleTap,
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 48.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              gradient: isButtonDisabled ? null : gradient,
              color: gradient == null
                  ? (bgColor ?? AppColors.c1A1A1A)
                  : (isButtonDisabled ? AppColors.c808080 : null),
              borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
              border: showBorder
                  ? Border.all(color: borderColor ?? AppColors.cCCCCCC)
                  : null,
            ),
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: CircularProgressIndicator(
                      color: fontColor ?? Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: mainAxisAlignment,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefixIcon != null) ...[
                        prefixIcon!,
                        SizedBox(width: 8.w),
                      ],
                      Text(btnName,
                          style: textStyle ??
                              TextFontStyle.textStyle16CFFFFFFGSM500),
                      if (suffixIcon != null) ...[
                        SizedBox(width: 8.w),
                        suffixIcon!,
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
























// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.onPressed,
//     required this.title,
//     this.isLoading = false,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.borderRadius,
//     this.height,
//     this.width,
//     this.textStyle,
//     this.padding,
//     this.disabledBackgroundColor, 
//     this.disabledForegroundColor, 
//   });

//   final VoidCallback? onPressed;
//   final String title;
//   final bool isLoading;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final BorderRadiusGeometry? borderRadius;
//   final double? height;
//   final double? width;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? padding;
//   final Color? disabledBackgroundColor;
//   final Color? disabledForegroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? double.infinity,
//       height: height ?? 50.h,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? AppColors.c1A1A1A,
//           foregroundColor: foregroundColor ?? AppColors.c1A1A1A,
//           disabledBackgroundColor: 
//               disabledBackgroundColor ?? AppColors.cCCCCCC.withValues(alpha:  0.5),
//           disabledForegroundColor: 
//               (disabledForegroundColor ?? AppColors.cCCCCCC).withValues(alpha: 0.5),
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: borderRadius ?? BorderRadius.circular(12.r),
//           ),
//           padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
//         ),
//         child: isLoading
//             ? SizedBox(
//                 width: 20.w,
//                 height: 20.h,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.w,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     foregroundColor ?? AppColors.c1A1A1A,
//                   ),
//                 ),
//               )
//             : Text(
//                 title,
//                 style: textStyle ?? TextFontStyle.textStyle16CFFFFFFGSM500,
//                 textAlign: TextAlign.center,
//               ),
//       ),
//     );
//   }
// }

// // Alternative function-style customButton (if you prefer function over class)
// Widget customButton({
//   required VoidCallback? onPressed,
//   required String title,
//   bool isLoading = false,
//   Color? backgroundColor,
//   Color? foregroundColor,
//   BorderRadiusGeometry? borderRadius,
//   double? height,
//   double? width,
//   TextStyle? textStyle,
//   EdgeInsetsGeometry? padding,
// }) {
//   return SizedBox(
//     width: width ?? double.infinity,
//     height: height ?? 50.h,
//     child: ElevatedButton(
//       onPressed: isLoading ? null : onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor ?? AppColors.cCCCCCC,
//         foregroundColor: foregroundColor ?? AppColors.cCCCCCC,
//         disabledBackgroundColor: 
//             (backgroundColor ?? AppColors.cFFFFFF).withValues(alpha:  0.5),
//         disabledForegroundColor: 
//             (foregroundColor ?? AppColors.cFFFFFF).withValues(alpha: 0.5),
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: borderRadius ?? BorderRadius.circular(12.r),
//         ),
//         padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
//       ),
//       child: isLoading
//           ? SizedBox(
//               width: 20.w,
//               height: 20.h,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2.w,
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   foregroundColor ?? AppColors.cFFFFFF,
//                 ),
//               ),
//             )
//           : Text(
//               title,
//               style: textStyle ?? TextFontStyle.textStyle12C1A1A1ADGSS600,
//               textAlign: TextAlign.center,
//             ),
//     ),
//   );
// }