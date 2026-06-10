import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'widgets/account_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 50.h,
        leftImage: const SizedBox(),
        title: "Account",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const CustomDivider(),
            ),
            AccountItem(
              onTap: () {
                NavigationService.navigateTo(Routes.myOrdersTopBar);
              },
              name: "My Orders", image: Assets.icons.box.path),
            CustomDivider(thickness: 8.h),
            AccountItem(
              onTap: (){
                NavigationService.navigateTo(Routes.myDetailsScreen);
              },
                name: "My Details", image: Assets.icons.person3dash.path),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 60.w),
              child: CustomDivider(
                thickness: 1.h,
              ),
            ),
            AccountItem(name: "Address Book", image: Assets.icons.home.path),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 60.w),
              child: CustomDivider(
                thickness: 1.h,
              ),
            ),
            AccountItem(
                name: "Payment Methods", image: Assets.icons.cardPng_.path),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 60.w),
              child: CustomDivider(
                thickness: 1.h,
              ),
            ),
            AccountItem(
                name: "Notifications", image: Assets.icons.notification.path),
            CustomDivider(thickness: 8.h),
            AccountItem(name: "FAQs", image: Assets.icons.question.path),
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 60.w),
              child: CustomDivider(
                thickness: 1.h,
              ),
            ),
            AccountItem(
              onTap: () {NavigationService.navigateTo(Routes.helpCenterScreen);},
                name: "Help Center", image: Assets.icons.headphones.path),
            CustomDivider(thickness: 8.h),
            AccountItem(
              showArrow: false,
                namestyle: TextFontStyle.textStyle14C1A1A1AGSR500
                    .copyWith(color: AppColors.cED1010),
                name: "Logout",
                image: Assets.icons.logout.path),
          ],
        ),
      ),
    );
  }
}
