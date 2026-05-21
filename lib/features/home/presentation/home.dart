import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/product_card.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/features/home/presentation/widgets/top_image_text.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import '../../../gen/assets.gen.dart';
import 'widgets/name_and_buttom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 50.h,
        leftImage: const SizedBox(),
        actionWidgets: [
          UIHelper.horizontalSpace(20.w),
          Image.asset(Assets.images.sashroy.path, height: 24.h, width: 150.w),
          const Spacer(),
          GestureDetector(
              onTap: () {},
              child: Image.asset(Assets.icons.notification.path,
                  height: 24.h, width: 24.w)),
          UIHelper.horizontalSpace(20.w),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                borderRadius: 10.r,
                focusBorderColor: AppColors.cE6E6E6,
                enableBorderColor: AppColors.cE6E6E6,
                fillColor: AppColors.cFFFFFF,
                prefixIcon: Image.asset(Assets.icons.search.path,
                    height: 24.h, width: 24.w),
                hintText: "Search for clothes...",
              ),
              UIHelper.verticalSpace(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.h),
                child: TopImageText(ontab: () {}),
              ),
              UIHelper.verticalSpace(40.h),
              const NameAndButtom(name: "New Arrival"),
              UIHelper.verticalSpace(8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      title: 'Regular Fit Slogan',
                      priceText: r'$ 1,190',
                      rating: 4.5,
                      image:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
                      onTap: () {},
                      onFavoriteTap: () {},
                      onCartTap: () {},
                    ),
                  ),
                  UIHelper.horizontalSpace(10.w),
                  Expanded(
                    child: ProductCard(
                      title: 'Regular Fit Polo',
                      priceText: r'$ 1,100',
                      discountText: '-20%',
                      rating: 4.5,
                      isFavorite: false,
                      image:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
                      onTap: () {},
                      onFavoriteTap: () {},
                      onCartTap: () {},
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  final bool isActive = index == 2;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: isActive
                        ? Container(
                            height: 12.w,
                            width: 12.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.c000000,
                                width: 1.4,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 4.w,
                                width: 4.w,
                                decoration: const BoxDecoration(
                                  color: AppColors.c000000,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 8.w,
                            width: 8.w,
                            decoration: const BoxDecoration(
                              color: AppColors.cCCCCCC,
                              shape: BoxShape.circle,
                            ),
                          ),
                  );
                }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
