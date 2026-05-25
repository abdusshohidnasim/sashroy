
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SizeSelectorSection extends StatelessWidget {
  const SizeSelectorSection({super.key, 
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose size",
          style: TextFontStyle.textStyle20C1A1A1AGSS600,
        ),
        UIHelper.verticalSpace(10.h),
        
        Row(
          children: sizes.map((size) {
            final bool isSelected = size == selectedSize;
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: GestureDetector(
                onTap: () => onSizeSelected(size),
                child: _buildSizeBox(size, isSelected: isSelected),
              ),
            );
          }).toList(),
        ),
        UIHelper.verticalSpace(120.h),
      ],
    );
  }

  Widget _buildSizeBox(String size, {required bool isSelected}) {
    return Container(
      width: 48.w,
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.c1A1A1A : AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? AppColors.c1A1A1A : AppColors.c808080.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        size,
        style: TextFontStyle.textStyle20C1A1A1AGSS600.copyWith(
          color: isSelected ? AppColors.cFFFFFF : AppColors.c1A1A1A,
        ),
      ),
    );
  }
}

