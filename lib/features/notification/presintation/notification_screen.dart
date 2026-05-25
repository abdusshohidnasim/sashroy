import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/gen/assets.gen.dart';
import '../../../common_widgets/commom_emtry_state.dart';
import '../../../common_widgets/custom_divider.dart';
import 'widgets/notification_item.dart';
import 'widgets/slection.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final bool isnotification = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: "Noatifications",
        height: 50.h,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
              child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: Column(
          children: [
            const CustomDivider(),
            ListView(
              shrinkWrap: true,
              children: [
                // Today Section
                const SectionTitle(title: 'Today'),
                NotificationItem(
                  iconpath: Assets.icons.discountCardFullClours.path,
                  title: '30% Special Discount!',
                  subtitle: 'Special promotion only valid today.',
                ),

                const CustomDivider(),

                // Yesterday Section
                const SectionTitle(title: 'Yesterday'),
                NotificationItem(
                  iconpath: Assets.icons.walletDuotone.path,
                  title: 'Top Up E-wallet Successfully!',
                  subtitle: 'You have top up your e-wallet.',
                ),
                NotificationItem(
                  iconpath: Assets.icons.locationFullColors.path,
                  title: 'New Service Available!',
                  subtitle: 'Now you can track order in real-time.',
                ),

                const CustomDivider(),

                // Date Section
                const SectionTitle(title: 'June 7, 2023'),
                NotificationItem(
                  iconpath: Assets.icons.userFullColros.path,
                  title: 'Account Setup Successfully!',
                  subtitle: 'Your account has been created.',
                ),
                const CustomDivider(),
              ],
            ),
            CustomEmptyState(
  imagePath: Assets.icons.notificationFullColors.path,
  title: "You haven’t gotten any notifications yet!",
  subtitle: "We’ll alert you when something cool happens.",
),
          ],
        ),
      ))),
    );
  }
}
