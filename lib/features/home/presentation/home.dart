import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/product_card.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/common_widgets/viw_all_widgtes.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/features/home/presentation/bloc/home_bloc.dart';
import 'package:sashroy/features/home/presentation/bloc/home_state.dart';
import 'package:sashroy/features/home/presentation/widgets/top_image_text.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import '../../../common_widgets/custom_dot_indicator.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/name_and_buttom.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              onTap: () {
                NavigationService.navigateTo(Routes.notificationScreen);
              },
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

                // ==================== NEW ARRIVAL SECTION ====================
                const _NewArrivalSection(),

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
                      const _SocialImagesRow(),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(40.h),

                // ==================== BEST SELLING SECTION ====================
                const _BestSellingSection(),

                UIHelper.verticalSpace(20.h),
                Center(
                  child: Column(
                    children: [
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
                      const _DealsOfMonthSection(),
                      UIHelper.verticalSpace(20.h),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                UIHelper.verticalSpace(40.h),

                // ==================== TOP RATED SECTION ====================
                const _TopRatedSection(),

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
        ),
      ),
    );
  }
}

// ==================== STATIC HELPER ====================

Widget _buildWhyChooseUsCard({
  required String title,
  required String subtitle,
  required String iconPath,
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

// ==================== SOCIAL IMAGES ROW ====================

class _SocialImagesRow extends StatelessWidget {
  const _SocialImagesRow();

  @override
  Widget build(BuildContext context) {
    final List<String> socialImages = [
      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1509631179647-0177331693ae?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?q=80&w=300&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1496747611176-843222e1e57c?q=80&w=300&auto=format&fit=crop',
    ];

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
    );
  }
}



class _NewArrivalSection extends StatelessWidget {
  const _NewArrivalSection();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeStateData>(
      buildWhen: (prev, curr) =>
          prev.newArrivalIndex != curr.newArrivalIndex ||
          prev.favoriteProductIds != curr.favoriteProductIds,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndButtom(
              name: "New Arrival",
              onLeftTap: state.newArrivalIndex == 0 ? null : bloc.newArrivalPrev,
              onRightTap: state.newArrivalIndex == HomeBloc.totalNewArrival - 1
                  ? null
                  : bloc.newArrivalNext,
            ),
            UIHelper.verticalSpace(8.h),
            SizedBox(
              height: 300.h,
              child: PageView.builder(
                controller: bloc.newArrivalController,
                itemCount: HomeBloc.totalNewArrival,
                clipBehavior: Clip.none,
                onPageChanged: bloc.onNewArrivalPageChanged,
                itemBuilder: (BuildContext context, int index) {
                  final int productId = index; // New Arrival: 0-5

                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ProductCard(
                      width: 165.w,
                      title: 'Regular Fit Slogan',
                      priceText: r'$ 1,190',
                      rating: 4.5,
                      image:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
                      isFavorite: state.favoriteProductIds.contains(productId),
                      onTap: () {},
                      onFavoriteTap: () => bloc.toggleFavorite(productId),
                      onCartTap: () {},
                    ),
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomDotIndicator(
              itemCount: HomeBloc.totalNewArrival,
              currentIndex: state.newArrivalIndex,
            ),
          ],
        );
      },
    );
  }
}

// ==================== BEST SELLING SECTION ====================

class _BestSellingSection extends StatelessWidget {
  const _BestSellingSection();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeStateData>(
      buildWhen: (prev, curr) =>
          prev.bestSellingIndex != curr.bestSellingIndex ||
          prev.favoriteProductIds != curr.favoriteProductIds,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndButtom(
              name: "Best Selling Products",
              onLeftTap: state.bestSellingIndex == 0 ? null : bloc.bestSellingPrev,
              onRightTap: state.bestSellingIndex == HomeBloc.totalBestSelling - 1
                  ? null
                  : bloc.bestSellingNext,
            ),
            UIHelper.verticalSpace(8.h),
            SizedBox(
              height: 300.h,
              child: PageView.builder(
                controller: bloc.bestSellingController,
                itemCount: HomeBloc.totalBestSelling,
                clipBehavior: Clip.none,
                onPageChanged: bloc.onBestSellingPageChanged,
                itemBuilder: (BuildContext context, int index) {
                  final int productId = 100 + index; // Best Selling: 100-105

                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ProductCard(
                      width: 165.w,
                      title: index % 2 == 0 ? 'Regular Fit Slogan' : 'Regular Fit Polo',
                      priceText: index % 2 == 0 ? r'$ 1,190' : r'$ 1,100',
                      discountText: index % 2 == 0 ? null : '-20%',
                      rating: 4.5,
                      image:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
                      isFavorite: state.favoriteProductIds.contains(productId),
                      onTap: () {},
                      onFavoriteTap: () => bloc.toggleFavorite(productId),
                      onCartTap: () {},
                    ),
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomDotIndicator(
              itemCount: HomeBloc.totalBestSelling,
              currentIndex: state.bestSellingIndex,
            ),
          ],
        );
      },
    );
  }
}

// ==================== TOP RATED SECTION ====================

class _TopRatedSection extends StatelessWidget {
  const _TopRatedSection();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeStateData>(
      buildWhen: (prev, curr) =>
          prev.topRatedIndex != curr.topRatedIndex ||
          prev.favoriteProductIds != curr.favoriteProductIds,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameAndButtom(
              name: "Top Rated Products",
              onLeftTap: state.topRatedIndex == 0 ? null : bloc.topRatedPrev,
              onRightTap: state.topRatedIndex == HomeBloc.totalTopRated - 1
                  ? null
                  : bloc.topRatedNext,
            ),
            UIHelper.verticalSpace(8.h),
            SizedBox(
              height: 300.h,
              child: PageView.builder(
                controller: bloc.topRatedController,
                itemCount: HomeBloc.totalTopRated,
                clipBehavior: Clip.none,
                onPageChanged: bloc.onTopRatedPageChanged,
                itemBuilder: (BuildContext context, int index) {
                  final int productId = 200 + index; // Top Rated: 200-205

                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ProductCard(
                      width: 165.w,
                      title: index % 2 == 0 ? 'Regular Fit Slogan' : 'Regular Fit Polo',
                      priceText: index % 2 == 0 ? r'$ 1,190' : r'$ 1,100',
                      discountText: index % 2 == 0 ? null : '-20%',
                      rating: 4.5,
                      image:
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=500&auto=format&fit=crop',
                      isFavorite: state.favoriteProductIds.contains(productId),
                      onTap: () {},
                      onFavoriteTap: () => bloc.toggleFavorite(productId),
                      onCartTap: () {},
                    ),
                  );
                },
              ),
            ),
            UIHelper.verticalSpace(8.h),
            CustomDotIndicator(
              itemCount: HomeBloc.totalTopRated,
              currentIndex: state.topRatedIndex,
            ),
          ],
        );
      },
    );
  }
}

// ==================== DEALS OF THE MONTH SECTION ====================

class _DealsOfMonthSection extends StatelessWidget {
  const _DealsOfMonthSection();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

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

    return SizedBox(
      height: 240.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              controller: bloc.dealsScrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
              child: BlocBuilder<HomeBloc, HomeStateData>(
                buildWhen: (prev, curr) =>
                    prev.dealsActiveIndex != curr.dealsActiveIndex,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final bool isActive = index == state.dealsActiveIndex;

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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}