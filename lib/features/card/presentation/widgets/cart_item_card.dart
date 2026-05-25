import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

class CartItemCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String size;
  final double price;
  final int quantity;
  final VoidCallback? onDelete;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.size,
    required this.price,
    required this.quantity,
    this.onDelete,
    this.onIncrement,
    this.onDecrement,
  });

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
          /// Product Image
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

          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Name & Delete Button Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextFontStyle.textStyle16C1A1A1AGSS600,
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

                    /// Delete Button
                    GestureDetector(
                      onTap: onDelete,
                      child: Image.asset(
                        Assets.icons.delete.path,
                        height: 20.h,
                        width: 20.w,
                        color: AppColors.cED1010,
                      ),
                    ),
                  ],
                ),
UIHelper.verticalSpace
(10.h),

                /// Price & Quantity Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Price
                    Text(
                      '\$ ${price.toStringAsFixed(0).replaceAllMapped(
                            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},',
                          )}',
                      style: TextFontStyle.textStyle16C1A1A1AGSS600,
                    ),

                    /// Quantity Selector
                    Row(
                      children: [
                        /// Decrement Button
                        _QuantityButton(
                          icon: Icons.remove,
                          onTap: onDecrement,
                        ),
                        Container(
                          width: 36.w,
                          alignment: Alignment.center,
                          child: Text(
                            '$quantity',
                            style: TextFontStyle.textStyle14C1A1A1AGSR500,
                          ),
                        ),

                        /// Increment Button
                        _QuantityButton(
                          icon: Icons.add,
                          onTap: onIncrement,
                        ),
                      ],
                    ),
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

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _QuantityButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.cE6E6E6,
            width: 1.2,
          ),
        ),
        child: Icon(
          icon,
          size: 16.sp,
          color: AppColors.c1A1A1A,
        ),
      ),
    );
  }
}
