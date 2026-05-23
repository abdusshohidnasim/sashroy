import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/product_card.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/common_widgets/viw_all_widgtes.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/features/home/presentation/widgets/top_image_text.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import '../../../gen/assets.gen.dart';
import 'widgets/name_and_buttom.dart';

class HomeScreen
    extends StatefulWidget {
  const HomeScreen(
      {super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  int _dealsActiveIndex =
      0;
  final ScrollController
      _dealsScrollController =
      ScrollController();

  @override
  void
      initState() {
    super.initState();
    _dealsScrollController.addListener(() {
      if (_dealsScrollController.hasClients) {
        final double offset = _dealsScrollController.offset;
        final double width0 = 165.w + 12.w;
        final double width1 = 135.w + 12.w;

        int index = 0;
        if (offset < width0 / 2) {
          index = 0;
        } else if (offset < width0 + width1 / 2) {
          index = 1;
        } else if (offset < width0 + width1 + width1 / 2) {
          index = 2;
        } else {
          index = 3;
        }

        if (index != _dealsActiveIndex && index >= 0 && index < 4) {
          setState(() {
            _dealsActiveIndex = index;
          });
        }
      }
    });
  }

  @override
  void
      dispose() {
    _dealsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget
      build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 50.h,
        leftImage: const SizedBox(),
        actionWidgets: [
          UIHelper.horizontalSpace(20.w),
          Image.asset(Assets.images.sashroy.path, height: 24.h, width: 150.w),
          const Spacer(),
          GestureDetector(onTap: () {
            NavigationService.navigateTo(Routes.notificationScreen); 
          }, child: Image.asset(Assets.icons.notification.path, height: 24.h, width: 24.w)),
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
                prefixIcon: Image.asset(Assets.icons.search.path, height: 24.h, width: 24.w),
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
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
              ),
              UIHelper.verticalSpace(20.h),
              Center(
                  child: Column(
                children: [
                  ViwAllWidgtes(ontab: () {}),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    "Follow Us on Social",
                    style: TextFontStyle.textStyle20C000000Poppins500,
                  ),
                  UIHelper.verticalSpace(10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Scelerisque duis ultrices sollicitudin aliquam sem. Scelerisque duis ultrices sollicitudin ",
                    style: TextFontStyle.textStyle12C8A8A8APoppins400,
                    maxLines: null,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(20.h),



                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final List<String> socialImages = [
                          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=300&auto=format&fit=crop',
                          'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=300&auto=format&fit=crop',
                          'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?q=80&w=300&auto=format&fit=crop',
                          'https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=300&auto=format&fit=crop',
                          'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=300&auto=format&fit=crop',
                          'https://images.unsplash.com/photo-1496747611176-843222e1e57c?q=80&w=300&auto=format&fit=crop',
                        ];

                        final isLarge = index % 2 == 0;
                        final double width = isLarge ? 80.w : 60.w;
                        final double height = isLarge ? 100.h : 80.h;

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          alignment: Alignment.center,
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.cE6E6E6,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: CachedNetworkImage(
                                imageUrl: socialImages[index],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: AppColors.cE6E6E6,
                                  child: const Center(
                                    child: SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                        color: AppColors.c1A1A1A,
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: AppColors.cE6E6E6,
                                  child: const Icon(Icons.error, size: 16),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )



                  
                ],
              )),
              UIHelper.verticalSpace(40.h),
              const NameAndButtom(name: "Best Selling Products"),
              UIHelper.verticalSpace(8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      title: 'Regular Fit Slogan',
                      priceText: r'$ 1,190',
                      rating: 4.5,
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
              ),
              Center(
                child: Column(children: [
                  UIHelper.verticalSpace(20.h),
                  ViwAllWidgtes(ontab: () {}),
                  UIHelper.verticalSpace(30.h),
                  Text(
                    "Deals of the Month",
                    style: TextFontStyle.textStyle20C000000Poppins500,
                  ),
                  UIHelper.verticalSpace(10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Scelerisque duis ultrices sollicitudin aliquam sem.  ",
                    style: TextFontStyle.textStyle12C8A8A8APoppins400,
                    maxLines: null,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(24.h),
                  SizedBox(
                    height: 240.h,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ListView.builder(
                            controller: _dealsScrollController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final List<String> dealsImages = [
                                'https://images.unsplash.com/photo-1595777457583-95e059d581b8?q=80&w=500&auto=format&fit=crop',
                                'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=500&auto=format&fit=crop',
                                'https://images.unsplash.com/photo-1483389127117-b6a2102724ae?q=80&w=500&auto=format&fit=crop',
                                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=500&auto=format&fit=crop',
                              ];

                              final List<Color> dealsBgColors = [
                                const Color(0xFFEFECE7),
                                const Color(0xFFE8ECEF),
                                const Color(0xFFE7E7E9),
                                const Color(0xFFEFECE7),
                              ];

                              final bool isFirst = index == 0;
                              final double width = isFirst ? 165.w : 135.w;
                              final double height = isFirst ? 230.h : 185.h;

                              return Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(right: 12.w),
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: dealsBgColors[index],
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: CachedNetworkImage(
                                      imageUrl: dealsImages[index],
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color: dealsBgColors[index],
                                        child: const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.c1A1A1A,
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Container(
                                        color: dealsBgColors[index],
                                        child: const Icon(Icons.error, size: 24),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 12.h,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                final bool isActive = index == _dealsActiveIndex;

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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                ]),
              ),
              UIHelper.verticalSpace(20.h),
              UIHelper.verticalSpace(40.h),
              const NameAndButtom(name: "Top Rated Products"),
              UIHelper.verticalSpace(8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductCard(
                      title: 'Regular Fit Slogan',
                      priceText: r'$ 1,190',
                      rating: 4.5,
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
                      image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
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
              ),
              UIHelper.verticalSpace(40.h),
              Text(
                "Why Choose Us",
                style: TextFontStyle.textStyle20C000000Poppins500,
              ),
              UIHelper.verticalSpace(20.h),
              Row(
                children: [
                  Expanded(
                    child: _buildWhyChooseUsCard(
                      title: "byCard",
                      subtitle: "crafted from top materials",
                      iconPath: Assets.icons.byCard.path,
                    ),
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Expanded(
                    child: _buildWhyChooseUsCard(
                      title: "star",
                      subtitle: "crafted from top materials",
                      iconPath: Assets.icons.star.path,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildWhyChooseUsCard(
                      title: "starHarijantal",
                      subtitle: "crafted from top materials",
                      iconPath: Assets.icons.starHarijantal.path,
                    ),
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Expanded(
                    child: _buildWhyChooseUsCard(
                      title: "circelBlackIcon",
                      subtitle: "crafted from top materials",
                      iconPath: Assets.icons.circelBlackIcon.path,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      )),
    );
  }

  Widget
      _buildWhyChooseUsCard({
    required String
        title,
    required String
        subtitle,
    required String
        iconPath,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.c000000.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 32.h,
            width: 32.w,
            fit: BoxFit.contain,
          ),
          UIHelper.horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle14C1A1A1ADGSM500.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                UIHelper.verticalSpace(2.h),
                Text(
                  subtitle,
                  style: TextFontStyle.textStyle12C808080GSR400.copyWith(
                    fontSize: 10.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
