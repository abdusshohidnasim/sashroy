import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'complited_screen.dart';
import 'on_going_screen.dart';

class MyOrdersTopBar extends StatelessWidget {
  const MyOrdersTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        height: 50.h,
        title: "My Orders",
        actionWidgets: [
          GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.notificationScreen);
              },
              child: Image.asset(Assets.icons.notification.path,
                  height: 24.h, width: 24.w)),
          UIHelper.horizontalSpace(20.w),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.cE6E6E6,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.c1A1A1A,
                  unselectedLabelColor: AppColors.c999999,
                  overlayColor:
                      WidgetStateProperty.all(Colors.transparent),
                  dividerColor: Colors.transparent,
                  labelStyle: TextFontStyle.textStyle14C1A1A1AGSS600,
                  unselectedLabelStyle:
                      TextFontStyle.textStyle14C808080GSR400,
                  indicator: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  tabs: const [
                    Tab(text: 'Ongoing'),
                    Tab(text: 'Completed'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  OnGoingScreen(),
                  CompletedScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
