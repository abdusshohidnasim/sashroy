import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/colors.gen.dart';

class CustomDotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color? activeColor;
  final Color? inactiveColor;

  const CustomDotIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color dotActive = activeColor ?? AppColors.c000000;
    final Color dotInactive = inactiveColor ?? AppColors.cCCCCCC;

    final double dotSize = 8.w;
    final double activeDotSize = 12.w;
    final double dotSpacing = 12.w;

    final double visibleWidth = (activeDotSize) + (2 * dotSize) + (2 * dotSpacing) + 8.w;

    int scrollIndex = currentIndex;
    if (scrollIndex > 0 && scrollIndex < itemCount - 1) {
      scrollIndex = currentIndex - 1;
    } else if (scrollIndex >= itemCount - 1 && itemCount > 3) {
      scrollIndex = itemCount - 3;
    } else {
      scrollIndex = 0;
    }

    final double scrollOffset = scrollIndex * (dotSize + dotSpacing);

    return Center(
      child: SizedBox(
        width: visibleWidth,
        height: 16.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          controller: ScrollController(initialScrollOffset: scrollOffset),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(itemCount, (index) {
              final bool isActive = index == currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                height: isActive ? activeDotSize : dotSize,
                width: isActive ? activeDotSize : dotSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Colors.transparent : dotInactive,
                  border: isActive ? Border.all(color: dotActive, width: 1.4) : null,
                ),
                child: isActive
                    ? Center(
                        child: Container(
                          height: 4.w,
                          width: 4.w,
                          decoration: BoxDecoration(
                            color: dotActive,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              );
            }),
          ),
        ),
      ),
    );
  }
}