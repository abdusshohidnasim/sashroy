import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class Imagesection extends StatelessWidget {
  const Imagesection({
    super.key,
    required this.isFavorite, 
    required this.imageUrl, 
    required this.onFavoriteTap,
  });
  
  final bool isFavorite;
  final String imageUrl;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.verticalSpace(10.h),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 368.h,
              decoration: BoxDecoration(
                color: AppColors.cE6E6E6.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 16.h,
              right: 16.w,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.01),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: isFavorite
                      ? Icon(
                          Icons.favorite_rounded,
                          color: AppColors.cED1010,
                          size: 24.sp,
                        )
                      : Icon(
                          Icons.favorite_border_rounded,
                          color: AppColors.c1A1A1A,
                          size: 24.sp,
                        ),
                ),
              ),
            ),
          ],
        ),
        UIHelper.verticalSpace(16.h),
      ],
    );
  }
}
