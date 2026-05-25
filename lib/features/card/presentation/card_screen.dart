import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';

import 'bloc/card_bloc.dart';
import 'bloc/card_event.dart';
import 'bloc/card_state.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/cart_summary_section.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(LoadCartEvent()),
      child: const _CardScreenView(),
    );
  }
}

class _CardScreenView extends StatelessWidget {
  const _CardScreenView();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        leftImage: UIHelper.verticalSpace(10.h),
        title: "My Cart",
        height: 60.h,
       
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          /// Loading state
          if (state.status == CartStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.c1A1A1A,
              ),
            );
          }

          /// Error state
          if (state.status == CartStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 60.sp,
                    color: AppColors.cED1010,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Something went wrong!',
                    style: TextFontStyle.textStyle16C1A1A1AGSS600,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.errorMessage ?? '',
                    style: TextFontStyle.textStyle14C808080GSR400,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onTap: () {
                      context.read<CartBloc>().add(LoadCartEvent());
                    },
                    btnName: 'Retry',
                    width: 120.w,
                    height: 44.h,
                    borderRadius: 22.r,
                  ),
                ],
              ),
            );
          }

          /// Empty cart state
          if (state.isEmpty) {
            return _buildEmptyCart();
          }

          /// Cart items loaded
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    SizedBox(height: 8.h),

                    /// Cart Item Cards
                    ...List.generate(state.cartItems.length, (index) {
                      final item = state.cartItems[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CartItemCard(
                          imageUrl: item.image,
                          productName: item.name,
                          size: item.size,
                          price: item.price,
                          quantity: item.quantity,
                          onDelete: () {
                            context.read<CartBloc>().add(
                                  RemoveCartItemEvent(itemId: item.id),
                                );
                          },
                          onIncrement: () {
                            context.read<CartBloc>().add(
                                  IncrementQuantityEvent(itemId: item.id),
                                );
                          },
                          onDecrement: () {
                            context.read<CartBloc>().add(
                                  DecrementQuantityEvent(itemId: item.id),
                                );
                          },
                        ),
                      );
                    }),

                    /// Summary Section
                    CartSummarySection(
                      subTotal: state.subTotal,
                      vatPercent: state.vatPercent,
                      shippingFee: state.shippingFee,
                    ),

                    SizedBox(height: 24.h),

                    /// Checkout Button
                    CustomButton(
                      onTap: () {
                        NavigationService.navigateTo(Routes.checkOutScreen);
                     
                      },
                      btnName: 'Go To Checkout',
                      height: 54.h,
                      borderRadius: 30.r,
                      bgColor: AppColors.c1A1A1A,
                      suffixIcon: Icon(
                        Icons.arrow_forward,
                        color: AppColors.cFFFFFF,
                        size: 20.sp,
                      ),
                    ),

                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Empty cart state
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80.sp,
            color: AppColors.cCCCCCC,
          ),
          SizedBox(height: 16.h),
          Text(
            'Your Cart Is Empty!',
            style: TextFontStyle.textStyle20C1A1A1AGSS600.copyWith(
              color: AppColors.c808080,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'When you add products, they’ll appear here.',
            style: TextFontStyle.textStyle14C808080GSR400,
          ),
        ],
      ),
    );
  }
}
