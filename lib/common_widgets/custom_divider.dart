import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class CustomDivider extends StatelessWidget {
  final double? thickness;
  final Color? colors;

  const CustomDivider({super.key, this.thickness, this.colors});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colors?? AppColors.cE6E6E6,
      thickness: thickness?? 1.h,
    );
  }
}