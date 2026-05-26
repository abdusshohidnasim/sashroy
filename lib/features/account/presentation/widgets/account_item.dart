import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class AccountItem extends StatelessWidget {
  final String? name;
  final TextStyle? namestyle;
  final String? image;  
  final VoidCallback? onTap;
  final bool? showArrow;

  const AccountItem({super.key, this.name, this.namestyle, this.image, this.onTap, this.showArrow = true});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Image.asset(image??Assets.icons.box.path, height: 24.h, width: 24.w),
                    UIHelper.horizontalSpace(16.w),
                    Text(name?? "My Orders",
                        style:namestyle?? TextFontStyle.textStyle14C1A1A1AGSR500),
                    const Spacer(),
                    if (showArrow ?? true)
                      Image.asset(Assets.icons.rightIconNoColors.path,
                          height: 24.h, width: 24.w),
                  ],
                ),
              ),
            ); 
  }
}