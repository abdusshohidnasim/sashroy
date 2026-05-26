import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

void showReviewBottomSheet(BuildContext context) {
  final controller = TextEditingController();
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.cFFFFFF,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) {
      return _ReviewBottomSheet(controller: controller);
    },
  ).whenComplete(controller.dispose);
}

class _ReviewBottomSheet extends StatefulWidget {
  final TextEditingController controller;

  const _ReviewBottomSheet({
    required this.controller,
  });

  @override
  State<_ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<_ReviewBottomSheet> {
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Leave a Review',
                style: TextFontStyle.textStyle16C1A1A1AGSS600,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: AppColors.c1A1A1A),
              ),
            ],
          ),
          Divider(
            color: AppColors.cE6E6E6,
            height: 12.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'How was your order?',
              style: TextFontStyle.textStyle14C1A1A1AGSS600,
            ),
          ),
          UIHelper.verticalSpace(4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Please give your rating and also your review.',
              style: TextFontStyle.textStyle12C808080GSR400,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final isSelected = index < _rating;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Icon(
                    Icons.star,
                    size: 26.sp,
                    color:
                        isSelected ? AppColors.cFCA120 : AppColors.cE6E6E6,
                  ),
                ),
              );
            }),
          ),
          UIHelper.verticalSpace(14.h),
          TextField(
            controller: widget.controller,
            minLines: 3,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Write your review...',
              hintStyle: TextFontStyle.textStyle12C808080GSR400,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.cE6E6E6),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.c1A1A1A),
              ),
            ),
          ),
          UIHelper.verticalSpace(16.h),
          CustomButton(
            onTap: () => Navigator.of(context).pop(),
            btnName: 'Submit',
            height: 48.h,
            borderRadius: 12.r,
          ),
          UIHelper.verticalSpace(8.h),
        ],
      ),
    );
  }
}
