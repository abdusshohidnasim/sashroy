import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/product_card.dart';
import '../../../helpers/all_routes.dart';

class SaveScreen extends StatelessWidget { 
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        leftImage: UIHelper.verticalSpace(10.h),
        title: "Saved Items",
        height: 60.h,
        actionWidgets: [
          Image.asset(
            Assets.icons.notification.path,
            height: 24.h,
            width: 24.w,
          ),
          UIHelper.horizontalSpace(20.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, ),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6, 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: (1.w / 1.50.h), 
            ),
            itemBuilder: (context, index) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return ProductCard(
                                     
                    imageHeight: constraints.maxWidth, 
                    borderRadius: BorderRadius.circular(16.r), 
                    title: 'Regular Fit Slogan', 
                    priceText: r'$ 1,190', 
                    rating: 5.0, 
                    isFavorite: true, 
                    image: 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=500&auto=format&fit=crop',
                    onTap: () {
                      NavigationService.navigateTo(Routes.detailsScreen);
                    },
                    onFavoriteTap: () {},
                    onCartTap: () {},
                  );
                },
              );
            },
          ),
        ),
      ),
    ); 
  }
}