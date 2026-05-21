import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class TopImageText extends StatelessWidget {
    final VoidCallback ontab;
    
   const TopImageText({super.key,required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Image.asset(
          Assets.images.ultimate.path,
          height: 60.h,
        ),
        Image.asset(
          Assets.images.sale.path,
          height: 90.h,
          width: 150.w,
        ),
        Text(
          "NEW COLLECTION",
          style: TextFontStyle.textStyle14C484848Poppins400,
        ),
        UIHelper.verticalSpace(20.h),
        GestureDetector(
          onTap: ontab, 
          child: Container(
            height: 35.h,
            width: 170.w,
            decoration: BoxDecoration(
                color: AppColors.c1A1A1A,
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Text(
                "SHOP NOW",
                style: TextFontStyle.textStyle14CFFFFFFPoppins500,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
