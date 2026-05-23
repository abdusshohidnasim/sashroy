import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../gen/assets.gen.dart';

class ViwAllWidgtes
    extends StatefulWidget {
  final String?
      text;
  final TextStyle?
      textstyle;
  final double?
      width;
  final double?
      hide; // height
  final Color?
      colors;
  final double?
      borderradius;
  final VoidCallback
      ontab;
  final Widget?
      suffixIcon;
  final Color?
      iconColor;
  final List<Color>?
      gradientColors;
  final Border?
      border;

  const ViwAllWidgtes({
    super.key,
    this.text,
    this.textstyle,
    this.width,
    this.hide,
    this.colors,
    this.borderradius,
    required this.ontab,
    this.suffixIcon,
    this.iconColor,
    this.gradientColors,
    this.border,
  });

  @override
  State<ViwAllWidgtes> createState() =>
      _ViwAllWidgtesState();
}

class _ViwAllWidgtesState
    extends State<ViwAllWidgtes>
    with
        SingleTickerProviderStateMixin {
  late AnimationController
      _animationController;
  late Animation<double>
      _scaleAnimation;

  @override
  void
      initState() {
    super.initState();
    _animationController =
        AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
  }

  @override
  void
      dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(
      TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(
      TapUpDetails details) {
    _animationController.reverse();
    widget.ontab();
  }

  void
      _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget
      build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Container(
          height: widget.hide ?? 36.h, // Adjusted default height for premium look
          width: widget.width ?? 120.w,
          decoration: BoxDecoration(
            color: widget.gradientColors != null ? null : (widget.colors ?? AppColors.c1A1A1A),
            gradient: widget.gradientColors != null
                ? LinearGradient(
                    colors: widget.gradientColors!,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderradius ?? 40.r),
            border: widget.border,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text ?? "VIEW ALL",
                  style: widget.textstyle ??
                      TextFontStyle.textStyle9CFFFFFFPoppins500.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5.sp,
                      ),
                ),
                SizedBox(width: 6.w),
                widget.suffixIcon ??
                    Image.asset(
                      Assets.icons.rightIconNoColors.path,
                      height: 10.h,
                      width: 10.w,
                      color: widget.iconColor ?? Colors.white,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
