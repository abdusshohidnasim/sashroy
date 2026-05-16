import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/ui_helpers.dart';

class CommonAuthText extends StatelessWidget {
  const CommonAuthText({
    super.key,

    required this.text,
    required this.buttontext,
    this.style,
    this.buttonTextStyle,
    this.bottomTextWidget,
    this.imagePath,
    this.imageWidth,
    this.topSpace,
     this.uihelperhide,
  });

  final String text;
  final String buttontext;
  
  // Customization er jonno options gulo nicher moto allow kora holo
  final TextStyle? style;
  final TextStyle? buttonTextStyle;
  final double? uihelperhide; // UIHelper hide korar jonno option
  final Widget? bottomTextWidget;
  final String? imagePath; // Custom image path jodi dorkar hoy
  final double? imageWidth; // Image er custom horizontal padding er jonno
  final double? topSpace; // Top spacing customise korar jonno

  @override
  Widget build(BuildContext context) {
    // Default style set kora hocche jodi bahi r theke pass na kora hoy
    final TextStyle finalTextStyle = style ?? TextFontStyle.textStyle28C1A1A1ADGSS600;
    final TextStyle finalButtonTextStyle = buttonTextStyle ?? TextFontStyle.textStyle16C808080GSR400;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Content unujayi jaiga nibe
        children: [
          // Top Space
          UIHelper.verticalSpace(topSpace ?? 100.h),
          
          // Image Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: imageWidth ?? 70.w),
            child: Image.asset(imagePath ?? Assets.images.sashroy.path),
          ),
          
  
            UIHelper.verticalSpace(uihelperhide ?? 40.h),
  
          
          // Main Text
          Text(
            text,
            style: finalTextStyle,
            textAlign: TextAlign.center,
          ),
          
          UIHelper.verticalSpace(8.h),
          
          // Bottom Text Widget or Button Text
          if (bottomTextWidget != null) 
            bottomTextWidget!
          else 
            Text(
              buttontext,
              style: finalButtonTextStyle,
              textAlign: TextAlign.center,
              maxLines: null,
            ),
        ],
      ),
    );
  }
}