import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import 'gen/assets.gen.dart';

final class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

final class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _rotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        reverseCurve: Curves.linear,
        parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.cFFFFFF,
          // image: DecorationImage(
          //   image: AssetImage(Assets.images.splash.path),
          //   fit: BoxFit.cover,
          // ),
        ),
        //decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Center(
          child: Container(
            height: double.infinity,
            width: 140.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.icons.solaceLogo.path,
                ),
                scale: 0.8,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(500.h),
                RotationTransition(
                  turns: _rotation,
                  child: Image.asset(
                    Assets.icons.animaitonIcon.path,
                    height: 50.h,
                    width: 70.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
