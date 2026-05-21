import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

final class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.priceText,
    required this.image,
    this.imageFit = BoxFit.cover,
    this.originalPriceText,
    this.discountText,
    this.rating,
    this.ratingMax = 5,
    this.onTap,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onCartTap,
    this.showFavoriteButton = true,
    this.showCartButton = true,
    this.imageAspectRatio = 1,
    this.borderRadius,
    this.backgroundColor,
    this.shadowColor,
    this.imageBackgroundColor,
    this.imagePadding,
    this.contentPadding,
    this.actionButtonSize,
    this.actionIconSize,
    this.actionButtonBackgroundColor,
    this.actionButtonShadowColor,
    this.favoriteActiveColor,
    this.favoriteInactiveColor,
    this.cartIconColor,
    this.starColor,
    this.starInactiveColor,
    this.starSize,
    this.titleStyle,
    this.priceStyle,
    this.originalPriceStyle,
    this.discountStyle,
    this.imageHeight,
  });

  final String title;
  final String priceText;
  final String image;
  final BoxFit imageFit;
  final double? imageHeight;

  final String? originalPriceText;
  final String? discountText;

  final double? rating;
  final int ratingMax;

  final VoidCallback? onTap;

  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onCartTap;

  final bool showFavoriteButton;
  final bool showCartButton;

  final double imageAspectRatio;

  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? shadowColor;

  final Color? imageBackgroundColor;
  final EdgeInsetsGeometry? imagePadding;
  final EdgeInsetsGeometry? contentPadding;

  final double? actionButtonSize;
  final double? actionIconSize;
  final Color? actionButtonBackgroundColor;
  final Color? actionButtonShadowColor;

  final Color? favoriteActiveColor;
  final Color? favoriteInactiveColor;
  final Color? cartIconColor;

  final Color? starColor;
  final Color? starInactiveColor;
  final double? starSize;

  final TextStyle? titleStyle;
  final TextStyle? priceStyle;
  final TextStyle? originalPriceStyle;
  final TextStyle? discountStyle;

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry radius = borderRadius ??
        BorderRadius.circular(
          16.r,
        );
    final Color cardColor = backgroundColor ?? AppColors.cFFFFFF;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                color:
                    (shadowColor ?? AppColors.c000000).withValues(alpha: 0.06),
                blurRadius: 16.r,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: cardColor,
            borderRadius: radius,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: SizedBox(
                height: imageHeight ?? 200.h,
                width: double.infinity,
                child: _ImageArea(
                  backgroundColor: imageBackgroundColor ??
                      AppColors.cE6E6E6.withValues(alpha: 0.35),
                  padding: imagePadding ?? EdgeInsets.zero,
                  image: image,
                  imageFit: imageFit,
                  showFavoriteButton: showFavoriteButton,
                  showCartButton: showCartButton,
                  isFavorite: isFavorite,
                  onFavoriteTap: onFavoriteTap,
                  onCartTap: onCartTap,
                  actionButtonSize: actionButtonSize ?? 44.w,
                  actionIconSize: actionIconSize ?? 22.sp,
                  actionButtonBackgroundColor:
                      actionButtonBackgroundColor ?? AppColors.cFFFFFF,
                  actionButtonShadowColor:
                      actionButtonShadowColor ?? AppColors.c000000,
                  favoriteActiveColor: favoriteActiveColor ?? AppColors.cD70808,
                  favoriteInactiveColor:
                      favoriteInactiveColor ?? AppColors.c1A1A1A,
                  cartIconColor: cartIconColor ?? AppColors.c1A1A1A,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: titleStyle ??
                    TextFontStyle.textStyle16C1A1A1AGSS600.copyWith(overflow: TextOverflow.ellipsis),
                   
               
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: _PriceRow(
                      priceText: priceText,
                      originalPriceText: originalPriceText,
                      discountText: discountText,
                      priceStyle:
                          priceStyle ?? TextFontStyle.textStyle12C808080GSM500,
                      originalPriceStyle: originalPriceStyle ??
                          TextFontStyle.textStyle12C808080GSM500.copyWith(
                            decoration: TextDecoration.lineThrough,
                          
                            
                          ),
                      discountStyle: discountStyle ??
                          TextFontStyle.textStyle12C808080GSM500.copyWith(
                            color: AppColors.cED1010,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  if (rating != null)
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: _StarRating(
                        rating: rating!,
                        maxRating: ratingMax,
                        size: starSize ?? 14.sp,
                        color: starColor ?? AppColors.cFCA120,
                        inactiveColor: starInactiveColor ??
                            AppColors.c808080.withValues(alpha: 0.35),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final class _ImageArea extends StatelessWidget {
  const _ImageArea({
    required this.backgroundColor,
    required this.padding,
    required this.image,
    required this.imageFit,
    required this.showFavoriteButton,
    required this.showCartButton,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onCartTap,
    required this.actionButtonSize,
    required this.actionIconSize,
    required this.actionButtonBackgroundColor,
    required this.actionButtonShadowColor,
    required this.favoriteActiveColor,
    required this.favoriteInactiveColor,
    required this.cartIconColor,
  });

  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final String image;
  final BoxFit imageFit;

  final bool showFavoriteButton;
  final bool showCartButton;

  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onCartTap;

  final double actionButtonSize;
  final double actionIconSize;
  final Color actionButtonBackgroundColor;
  final Color actionButtonShadowColor;

  final Color favoriteActiveColor;
  final Color favoriteInactiveColor;
  final Color cartIconColor;

  @override
  Widget build(BuildContext context) {
    final double inset = 12.w;

    return Container(
      color: backgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: padding,
            child: _CardImage(
              image: image,
              fit: imageFit,
            ),
          ),
          if (showFavoriteButton)
            Positioned(
              top: inset,
              right: inset,
              child: _OverlayActionButton(
                icon: isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                iconColor:
                    isFavorite ? favoriteActiveColor : favoriteInactiveColor,
                onTap: onFavoriteTap,
                size: actionButtonSize,
                iconSize: actionIconSize,
                backgroundColor: actionButtonBackgroundColor,
                shadowColor: actionButtonShadowColor,
                semanticLabel: 'Favorite',
              ),
            ),
          if (showCartButton)
            Positioned(
              bottom: inset,
              right: inset,
              child: _OverlayActionButton(
                icon: Icons.shopping_cart_outlined,
                iconColor: cartIconColor,
                onTap: onCartTap,
                size: actionButtonSize,
                iconSize: actionIconSize,
                backgroundColor: actionButtonBackgroundColor,
                shadowColor: actionButtonShadowColor,
                semanticLabel: 'Add to cart',
              ),
            ),
        ],
      ),
    );
  }
}

final class _CardImage extends StatelessWidget {
  const _CardImage({required this.image, required this.fit});

  final String image;
  final BoxFit fit;

  bool get _isNetworkImage {
    return image.startsWith('http://') || image.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    if (_isNetworkImage) {
      return Image.network(
        image,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppColors.cE6E6E6,
            alignment: Alignment.center,
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 28.sp,
              color: AppColors.c808080,
            ),
          );
        },
      );
    }

    return Image.asset(image, fit: fit);
  }
}

final class _OverlayActionButton extends StatelessWidget {
  const _OverlayActionButton({
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.size,
    required this.iconSize,
    required this.backgroundColor,
    required this.shadowColor,
    required this.semanticLabel,
  });

  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  final double size;
  final double iconSize;

  final Color backgroundColor;
  final Color shadowColor;

  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(14.r);

    return Semantics(
      button: true,
      label: semanticLabel,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: shadowColor.withValues(alpha: 0.12),
              blurRadius: 12.r,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: backgroundColor,
          borderRadius: radius,
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: SizedBox(
              height: size,
              width: size,
              child: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.priceText,
    required this.originalPriceText,
    required this.discountText,
    required this.priceStyle,
    required this.originalPriceStyle,
    required this.discountStyle,
  });

  final String priceText;
  final String? originalPriceText;
  final String? discountText;

  final TextStyle priceStyle;
  final TextStyle originalPriceStyle;
  final TextStyle discountStyle;

  @override
  Widget build(BuildContext context) {
    final List<Widget> parts = [];

    final String? original = originalPriceText?.trim();
    if (original != null && original.isNotEmpty) {
      parts.add(Text(original, style: originalPriceStyle));
    }

    parts.add(Text(priceText, style: priceStyle));

    final String? discount = discountText?.trim();
    if (discount != null && discount.isNotEmpty) {
      parts.add(Text(discount, style: discountStyle));
    }

    return Wrap(
      spacing: 6.w,
      runSpacing: 2.h,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: parts,
    );
  }
}

final class _StarRating extends StatelessWidget {
  const _StarRating({
    required this.rating,
    required this.maxRating,
    required this.size,
    required this.color,
    required this.inactiveColor,
  });

  final double rating;
  final int maxRating;
  final double size;
  final Color color;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final double clamped = rating.clamp(0, maxRating).toDouble();
    final int fullStars = clamped.floor();
    final bool hasHalfStar = (clamped - fullStars) >= 0.5;
    final int emptyStars = maxRating - fullStars - (hasHalfStar ? 1 : 0);

    final List<Widget> stars = [];

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star_rounded, size: size, color: color));
    }

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half_rounded, size: size, color: color));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        Icon(
          Icons.star_outline_rounded,
          size: size,
          color: inactiveColor,
        ),
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
