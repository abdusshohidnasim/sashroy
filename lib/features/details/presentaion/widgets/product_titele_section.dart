import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class ProductTitleSection extends StatelessWidget {
  const ProductTitleSection({super.key, this.imagname});
  final String? imagname;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          imagname ?? "Regular Fit Slogan",
          style: TextFontStyle.textStyle24C1A1A1ADGSS600,
        ),
        UIHelper.verticalSpace(8.h),
      ],
    );
  }
}