import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/colors.gen.dart';
import 'widgets/order_item_card.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: _completedOrders.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final order = _completedOrders[index];
        return OrderItemCard(
          imageUrl: order.imageUrl,
          productName: order.productName,
          size: order.size,
          price: order.price,
          statusLabel: 'Completed',
          statusBackgroundColor: AppColors.c34A853.withValues(alpha: 0.15),
          statusTextColor: AppColors.c34A853,
          trailing: order.ratingLabel != null
              ? RatingChip(ratingLabel: order.ratingLabel!)
              : const ReviewButton(),
        );
      },
    );
  }
}

class _CompletedOrder {
  final String imageUrl;
  final String productName;
  final String size;
  final double price;
  final String? ratingLabel;

  const _CompletedOrder({
    required this.imageUrl,
    required this.productName,
    required this.size,
    required this.price,
    this.ratingLabel,
  });
}

const List<_CompletedOrder> _completedOrders = [
  _CompletedOrder(
    imageUrl: 'assets/images/ULTIMATE.png',
    productName: 'Regular Fit Slogan',
    size: 'M',
    price: 1190,
  ),
  _CompletedOrder(
    imageUrl: 'assets/images/sale.png',
    productName: 'Regular Fit Polo',
    size: 'L',
    price: 1100,
    ratingLabel: '4.5/5',
  ),
  _CompletedOrder(
    imageUrl: 'assets/images/SASHROY.png',
    productName: 'Regular Fit Black',
    size: 'L',
    price: 1690,
  ),
  _CompletedOrder(
    imageUrl: 'assets/images/ULTIMATE.png',
    productName: 'Regular Fit V-Neck',
    size: 'S',
    price: 1290,
  ),
  _CompletedOrder(
    imageUrl: 'assets/images/sale.png',
    productName: 'Regular Fit Pink',
    size: 'M',
    price: 1341,
    ratingLabel: '3.5/5',
  ),
];
