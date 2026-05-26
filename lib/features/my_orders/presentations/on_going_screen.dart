import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'widgets/order_item_card.dart';

class OnGoingScreen extends StatelessWidget {
  const OnGoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (_ongoingOrders.isEmpty) {
      return const _EmptyOrdersState(
        title: 'No Ongoing Orders!',
        subtitle: 'You don’t have any ongoing orders\nat this time.',
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: _ongoingOrders.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final order = _ongoingOrders[index];
        return OrderItemCard(
          imageUrl: order.imageUrl,
          productName: order.productName,
          size: order.size,
          price: order.price,
          statusLabel: order.statusLabel,
          statusBackgroundColor: AppColors.cE6E6E6,
          statusTextColor: AppColors.c1A1A1A,
        );
      },
    );
  }
}

class _OngoingOrder {
  final String imageUrl;
  final String productName;
  final String size;
  final double price;
  final String statusLabel;

  const _OngoingOrder({
    required this.imageUrl,
    required this.productName,
    required this.size,
    required this.price,
    required this.statusLabel,
  });
}

const List<_OngoingOrder> _ongoingOrders = [
  _OngoingOrder(
    imageUrl: 'assets/images/ULTIMATE.png',
    productName: 'Regular Fit Slogan',
    size: 'M',
    price: 1190,
    statusLabel: 'In Transit',
  ),
  _OngoingOrder(
    imageUrl: 'assets/images/sale.png',
    productName: 'Regular Fit Polo',
    size: 'L',
    price: 1100,
    statusLabel: 'Picked',
  ),
  _OngoingOrder(
    imageUrl: 'assets/images/SASHROY.png',
    productName: 'Regular Fit Black',
    size: 'L',
    price: 1690,
    statusLabel: 'In Transit',
  ),
  _OngoingOrder(
    imageUrl: 'assets/images/ULTIMATE.png',
    productName: 'Regular Fit V-Neck',
    size: 'S',
    price: 1290,
    statusLabel: 'Packing',
  ),
  _OngoingOrder(
    imageUrl: 'assets/images/sale.png',
    productName: 'Regular Fit Pink',
    size: 'M',
    price: 1341,
    statusLabel: 'Picked',
  ),
];

class _EmptyOrdersState extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EmptyOrdersState({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.icons.box.path,
              height: 56.h,
              width: 56.w,
              color: AppColors.cB3B3B3,
            ),
            UIHelper.verticalSpace(16.h),
            Text(
              title,
              style: TextFontStyle.textStyle20C1A1A1AGSS600,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              subtitle,
              style: TextFontStyle.textStyle14C808080GSR400,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
