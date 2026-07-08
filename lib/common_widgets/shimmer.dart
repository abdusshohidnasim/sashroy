import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/gen/colors.gen.dart';

class Shimmer extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const Shimmer({
    super.key,
    required this.child,
    this.enabled = true,
  });

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Color(0xFFEBEBEB),
                Color(0xFFF8F8F8),
                Color(0xFFEBEBEB),
              ],
              stops: const [0.15, 0.5, 0.85],
              transform:
                  _SlidingGradientTransform(slidePercent: _controller.value),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
        bounds.width * (slidePercent - 0.5) * 2, 0.0, 0.0);
  }
}

class ShimmerLoadingCard extends StatelessWidget {
  final double width;
  const ShimmerLoadingCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(16.r);

    return SizedBox(
      width: width,
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Area Shimmer
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c1A1A1A.withValues(alpha: 0.05),
                    blurRadius: 16.r,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
            ),
            // Content Area Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Shimmer
                  Container(
                    height: 16.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Price & Rating Row Shimmer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 14.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      Container(
                        height: 14.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
