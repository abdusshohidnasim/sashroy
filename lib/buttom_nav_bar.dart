import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/features/home/presentation/home.dart';
import '../gen/colors.gen.dart';
import '../constants/text_font_style.dart';
import 'gen/assets.gen.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
   HomeScreen(),
   Center(child: Text("Listings Screen")),
    Center(child: Text("Add Screen")),
    Center(child: Text("Messages Screen")),
    Center(child: Text("Profile Screen")),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 110.h,
        padding: EdgeInsets.only(bottom: 20.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              //  borderRadius: BorderRadiusGeometry.circular(12.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  height: 70.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: AppColors.cFFFFFF.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem(Assets.icons.hardNoColors.path, "Home", 0),
                      _navItem(Assets.icons.hardNoColors.path, "Listings", 1),
                      SizedBox(
                        width: 50.w,
                      ),
                      _navItem(Assets.icons.hardNoColors.path, "Messages", 3),
                      _navItem(Assets.icons.hardNoColors.path, "Profile", 4),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: 60.h,
                width: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cFFFFFF.withValues(alpha: 0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(),
                    child: Ink(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment(1.68, -0.56),
                          end: Alignment(0.18, 0.88),
                          colors: [
                            AppColors.cABB0BC,
                            AppColors.c000000,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(Icons.add,
                            color: AppColors.cFFFFFF, size: 30.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    String activeIcon,
    String label,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(activeIcon,
              height: 24.h,
              width: 24.w,
              color: isSelected ? AppColors.c000000 : AppColors.c0C9409),

          // Icon(
          //   isSelected ? activeIcon : inactiveIcon,
          //   color: isSelected
          //       ? AppColors.c1466D9
          //       : const Color(0xFF6F767E),
          //   size: 24.sp,
          // ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextFontStyle.textStyle12C1A1A1ADGSS600.copyWith(
              color: isSelected ? AppColors.c000000 : const Color(0xFF6F767E),
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _addbutton(

  //    String label,
  //     int i,

  // )

  // {
  //     bool isSelecte = _selectedIndex == i;
  //   return Row(

  //     children: [
  //       Text(label),
  //       UIHelper.horizontalSpace(50.w)
  //      //  SizedBox(width: 50.w),
  //     ],
  //   );

  // }
}
