import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/ui_helpers.dart'; // আপনার প্রজেক্টের পাথ অনুযায়ী পরিবর্তন করতে পারেন

class CustomEmptyState extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double? imageHeight;
  final double? imageWidth;

  const CustomEmptyState({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ডাইনামিক ইমেজ
            Image.asset(
              imagePath,
              height: imageHeight ?? 80.h,
              width: imageWidth ?? 80.w,
              fit: BoxFit.contain,
            ),
            UIHelper.verticalSpace(24.h),
            
            // ডাইনামিক টাইটেল
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff1A1A1A), // আপনার TextFontStyle অনুযায়ী
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(10.h),
            
            // ডাইনামিক সাবটাইটেল
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff808080), // আপনার TextFontStyle অনুযায়ী
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}