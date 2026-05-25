
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key, 
    required this.priceText, 
    required this.onAddToCartTap,
  });

  final String priceText;
  final VoidCallback onAddToCartTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        border: Border(
          top: BorderSide(
            color: AppColors.c808080.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextFontStyle.textStyle16C808080GSR400.copyWith(
                  color: AppColors.c1A1A1A.withValues(alpha: 0.6)
                ),
              ),
           
              Text(
                priceText,
                style: TextFontStyle.textStyle24C1A1A1ADGSS600,

              ),
              


            ],
          ),
          UIHelper.horizontalSpace(40.w),
          Expanded(
            child: CustomButton(
              prefixIcon: Image.asset(Assets.icons.bag.path,height: 24.h,),
              bgColor: AppColors.c1A1A1A,
              onTap: (){}, btnName: "   Add to Cart"),
          )
         
        ],
      ),
    );
  }
}