import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/text_font_style.dart';
import 'widgets/bottom_actionbar.dart';
import 'widgets/imagesection_widgets.dart';
import 'widgets/product_titele_section.dart';
import 'widgets/rating_section.dart';
import 'widgets/size_slector_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const String apiImageName = "Regular Fit Slogan";
    const String apiPrice = r"$ 1,190";
    const String apiImageUrl = 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=500&auto=format&fit=crop';
    const String apiDetailText = "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.";
    const String apiRating = "4.0/5";
    const String apiRatingViews = "(45 reviews)";
    const bool apiIsFavorite = false;

    const List<String> apiAvailableSizes = ["S", "M", "L", "XL"];
    const String apiSelectedSize = "M"; 

    return CustomScaffold(
      appBar: CustomAppBar(
        title: "Details",
        height: 50.h,
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
        child: Stack(
          children: [
     
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
         
                      Imagesection(
                        imageUrl: apiImageUrl,
                        isFavorite: apiIsFavorite,
                        onFavoriteTap: () {
                        
                        },
                      ),
                    const  ProductTitleSection(
                        imagname: apiImageName,
                      ),
                      RatingSection(
                        ontab: (){},
                        rating: apiRating,
                        ratingviews: apiRatingViews,
                      ),
                  const DescriptionSection(
                        detailtext: apiDetailText,
                      ),
                      SizeSelectorSection(
                        sizes: apiAvailableSizes,
                        selectedSize: apiSelectedSize,
                        onSizeSelected: (size) {
                         
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomActionBar(
                priceText: apiPrice,
                onAddToCartTap: () {
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, this.detailtext});
  final String? detailtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          detailtext ?? "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
          style: TextFontStyle.textStyle14C808080GSR400.copyWith(
            height: 1.5,
          ),
        ),
        UIHelper.verticalSpace(24.h),
      ],
    );
  }
}
