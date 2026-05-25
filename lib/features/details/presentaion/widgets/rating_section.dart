import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class RatingSection extends StatelessWidget {
  const RatingSection(
      {super.key, this.rating, this.ratingviews, required this.ontab});
  final String? rating;
  final String? ratingviews;
  final VoidCallback ontab;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontab,
          child: Row(
            children: [
              Icon(Icons.star_rounded, color: AppColors.cFCA120, size: 20.sp),
              UIHelper.horizontalSpace(4.w),
              Text(
                rating ?? "4.0/5",
                style: TextFontStyle.textStyle16C1A1A1ADGSM500,
              ),
              UIHelper.horizontalSpace(6.w),
              Text(
                ratingviews ?? "(45 reviews)",
                style: TextFontStyle.textStyle16C1A1A1ADGSM500.copyWith(
                  color: AppColors.c808080,
                ),
              ),
            ],
          ),
        ),
        UIHelper.verticalSpace(16.h),
      ],
    );
  }
}