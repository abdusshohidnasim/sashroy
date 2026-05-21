import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class NameAndButtom extends StatelessWidget {

  final String name;
  const NameAndButtom({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        Text(name, style: TextFontStyle.textStyle20C000000Poppins500),
        const Spacer(),
        Container(
          height: 30.h,
          width: 30.w,
          decoration: const BoxDecoration(
            color: AppColors.cFFFFFF,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -45 * 3.1415926535 , // Rotate the icon by -45 degrees
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                Assets.icons.rightIconNoColors.path,
                         
                color: AppColors.c000000,
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(10.w),
        Container(
          height: 30.h,
          width: 30.w,
          decoration:const BoxDecoration(
            color: AppColors.cFFFFFF,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              Assets.icons.rightIconNoColors.path,
            
              color: AppColors.c000000,
            ),
          ),
        )
      ],
    );
 
 
  }
}