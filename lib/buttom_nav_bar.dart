import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/features/card/presentation/card_screen.dart';
import 'package:sashroy/features/home/presentation/home.dart';
import 'package:sashroy/features/save/presentation/save_screen.dart';
import '../gen/colors.gen.dart';
import '../constants/text_font_style.dart';
import 'features/account/presentation/account_screen.dart';
import 'gen/assets.gen.dart';

class ButtomNavBar
    extends StatefulWidget {
  const ButtomNavBar(
      {super.key});

  @override
  State<ButtomNavBar> createState() =>
      _ButtomNavBarState();
}

class _ButtomNavBarState
    extends State<ButtomNavBar> {
  int _selectedIndex =
      0;

  final List<Widget>
      _screens = [
    const HomeScreen(),
    const Center(child: Text("Listings Screen")),
    const SaveScreen(),
    const CardScreen(),
    const AccountScreen(),
    const Center(child: Text("Profile Screen")),
  ];

  void _onItemTapped(
      int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget
      build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColors.cFFFFFF, boxShadow: [
          BoxShadow(
            color: AppColors.c999999,
            blurRadius: 1,
          ),
        ]),
        height: 80.h,
        padding: EdgeInsets.only(bottom: 20.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(Assets.icons.home.path, "Home", 0),
                  _navItem(Assets.icons.search.path, "Search", 1),
                  _navItem(Assets.icons.hardButomnav.path, "Saved", 2),
                  _navItem(Assets.icons.byCardButtomNav.path, "Cart", 3),
                  _navItem(Assets.icons.user.path, "Account", 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget
      _navItem(
    String
        activeIcon,
    String
        label,
    int index,
  ) {
    bool
        isSelected =
        _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(activeIcon, height: 24.h, width: 24.w, color: isSelected ? AppColors.c1A1A1A : AppColors.c999999),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextFontStyle.textStyle12C808080GSM500.copyWith(
              color: isSelected ? AppColors.c1A1A1A : AppColors.c999999,
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
