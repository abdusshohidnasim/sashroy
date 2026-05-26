import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import 'review_bottom_sheet.dart';

class OrderItemCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String size;
  final double price;
  final String statusLabel;
  final Color statusBackgroundColor;
  final Color statusTextColor;
  final Widget? trailing;

  const OrderItemCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.size,
    required this.price,
    required this.statusLabel,
    required this.statusBackgroundColor,
    required this.statusTextColor,
    this.trailing,
  });

  String _formatPrice(double value) {
    return value
        .toStringAsFixed(value.truncateToDouble() == value ? 0 : 2)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.cE6E6E6,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.cE6E6E6.withValues(alpha: 0.3),
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildProductImage(),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style:
                                TextFontStyle.textStyle16C1A1A1AGSS600,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Size $size',
                            style: TextFontStyle.textStyle12C808080GSR400,
                          ),
                        ],
                      ),
                    ),
                    _StatusChip(
                      label: statusLabel,
                      backgroundColor: statusBackgroundColor,
                      textColor: statusTextColor,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${_formatPrice(price)}',
                      style: TextFontStyle.textStyle16C1A1A1AGSS600,
                    ),
                    if (trailing != null) trailing!,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    final bool isNetwork =
        imageUrl.startsWith('http://') || imageUrl.startsWith('https://');
    if (isNetwork) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 28.sp,
              color: AppColors.c808080,
            ),
          );
        },
      );
    }
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const _StatusChip({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: TextFontStyle.textStyle12C1A1A1ADGSS600.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

class ReviewButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const ReviewButton({
    super.key,
    this.label = 'Leave Review',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final VoidCallback handleTap =
        onTap ?? () => showReviewBottomSheet(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: handleTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.c1A1A1A,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            label,
            style: TextFontStyle.textStyle14CFFFFFFPoppins500,
          ),
        ),
      ),
    );
  }
}

class RatingChip extends StatelessWidget {
  final String ratingLabel;

  const RatingChip({
    super.key,
    required this.ratingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.cE6E6E6,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.icons.star.path,
            height: 14.h,
            width: 14.w,
            color: AppColors.cFCA120,
          ),
          SizedBox(width: 6.w),
          Text(
            ratingLabel,
            style: TextFontStyle.textStyle12C808080GSM500,
          ),
        ],
      ),
    );
  }
}
