import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_appbar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: "Help Center",
        height: 50.h,
        actionWidgets: [
          Image.asset(
            Assets.icons.notification.path,
            height: 24.h,
            width: 24.w,
          ),
          UIHelper.horizontalSpace(20.w),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomDivider(),
              UIHelper.verticalSpace(20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
