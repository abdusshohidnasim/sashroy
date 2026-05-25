import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class CartSummarySection extends StatelessWidget {
  final double subTotal;
  final double vatPercent;
  final double shippingFee;

  const CartSummarySection({
    super.key,
    required this.subTotal,
    required this.vatPercent,
    required this.shippingFee,
  });

  double get vatAmount => subTotal * (vatPercent / 100);
  double get total => subTotal + vatAmount + shippingFee;

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
    return Column(
      children: [
        SizedBox(height: 16.h),

        /// Sub-total
        _SummaryRow(
          label: 'Sub-total',
          value: '\$ ${_formatPrice(subTotal)}',
        ),
        SizedBox(height: 10.h),

        /// VAT
        _SummaryRow(
          label: 'VAT (%)',
          value: '\$ ${vatAmount.toStringAsFixed(2)}',
        ),
        SizedBox(height: 10.h),

        /// Shipping fee
        _SummaryRow(
          label: 'Shipping fee',
          value: '\$ ${_formatPrice(shippingFee)}',
        ),

        /// Divider
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Divider(
            color: AppColors.cE6E6E6,
            thickness: 1.h,
          ),
        ),

        /// Total
        _SummaryRow(
          label: 'Total',
          value: '\$ ${_formatPrice(total)}',
          isTotal: true,
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? TextFontStyle.textStyle16C1A1A1AGSS600
              : TextFontStyle.textStyle14C808080GSR400,
        ),
        Text(
          value,
          style: isTotal
              ? TextFontStyle.textStyle20C1A1A1AGSS600
                  .copyWith(fontWeight: FontWeight.w700)
              : TextFontStyle.textStyle14C1A1A1AGSR500,
        ),
      ],
    );
  }
}
