import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/text_font_style.dart';
import '../../../features/card/presentation/bloc/card_bloc.dart';
import '../../../features/card/presentation/bloc/card_event.dart';
import '../../../features/card/presentation/bloc/card_state.dart';
import '../../../features/card/presentation/widgets/cart_summary_section.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'bloc/check_out_bloc.dart';
import 'bloc/check_out_event.dart';
import 'bloc/check_out_state.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(LoadCartEvent())),
        BlocProvider(create: (_) => CheckOutBloc()..add(LoadCheckOutEvent())),
      ],
      child: const _CheckOutScreenView(),
    );
  }
}

class _CheckOutScreenView extends StatelessWidget {
  const _CheckOutScreenView();

  @override
  Widget build(BuildContext context) {
    final TextEditingController promoController = TextEditingController();

    return CustomScaffold(
      appBar: CustomAppBar(
        title: "Checkout",
        height: 60.h,
        
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          if (cartState.status == CartStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.c1A1A1A,
              ),
            );
          }

          if (cartState.status == CartStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 60.sp,
                    color: AppColors.cED1010,
                  ),
                  UIHelper.verticalSpace(12.h),
                  Text(
                    'Something went wrong!',
                    style: TextFontStyle.textStyle16C1A1A1AGSS600,
                  ),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    cartState.errorMessage ?? '',
                    style: TextFontStyle.textStyle14C808080GSR400,
                    textAlign: TextAlign.center,
                  ),
                  UIHelper.verticalSpace(16.h),
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

          if (cartState.isEmpty) {
            return _buildEmptyCart();
          }

          return BlocBuilder<CheckOutBloc, CheckOutState>(
            builder: (context, checkoutState) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomDivider(),
                            UIHelper.verticalSpace(16.h),
                            _SectionHeader(
                              title: 'Delivery Address',
                              actionLabel: 'Change',
                              onAction: () async {
                                if (context.mounted) {
                                  final result =
                                      await NavigationService.navigateTo(
                                    Routes.addressSelectionScreen,
                                  );
                                  if (result != null && context.mounted) {
                                    context.read<CheckOutBloc>().add(
                                          ChangeAddressEvent(
                                            address: result.address,
                                            title: result.title,
                                          ),
                                        );
                                  }
                                }
                              },
                            ),
                            UIHelper.verticalSpace(10.h),
                            _AddressCard(
                              title: checkoutState.addressTitle,
                              address: checkoutState.addressFull,
                            ),
                            UIHelper.verticalSpace(20.h),
                            const CustomDivider(),
                            UIHelper.verticalSpace(16.h),
                            const _SectionHeader(title: 'Payment Method'),
                            UIHelper.verticalSpace(10.h),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final itemWidth =
                                    (constraints.maxWidth - 10.w) / 2;
                                return Wrap(
                                  spacing: 10.w,
                                  runSpacing: 10.h,
                                  children: [
                                    SizedBox(
                                      width: itemWidth,
                                      child: _PaymentOption(
                                        iconPath:
                                            Assets.icons.walletDuotone.path,
                                        label: 'Cash On Delivery',
                                        isSelected: checkoutState
                                                .selectedPaymentMethod ==
                                            'cashOnDelivery',
                                        onTap: () {
                                          context.read<CheckOutBloc>().add(
                                                SelectPaymentMethodEvent(
                                                  paymentMethod:
                                                      'cashOnDelivery',
                                                ),
                                              );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: itemWidth,
                                      child: _PaymentOption(
                                        iconPath: Assets.icons.cardPng.path,
                                        label: 'Online Payment',
                                        isSelected: checkoutState
                                                .selectedPaymentMethod ==
                                            'onlinePayment',
                                        onTap: () {
                                          context.read<CheckOutBloc>().add(
                                                SelectPaymentMethodEvent(
                                                  paymentMethod:
                                                      'onlinePayment',
                                                ),
                                              );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            UIHelper.verticalSpace(20.h),
                            const CustomDivider(),
                            UIHelper.verticalSpace(20.h),
                            const CustomDivider(),
                            UIHelper.verticalSpace(16.h),
                            Text(
                              'Order Summary',
                              style: TextFontStyle.textStyle16C1A1A1AGSS600,
                            ),
                            CartSummarySection(
                              subTotal: cartState.subTotal,
                              vatPercent: cartState.vatPercent,
                              shippingFee: cartState.shippingFee,
                            ),
                            UIHelper.verticalSpace(12.h),
                            if (checkoutState.discountAmount > 0)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Promo Discount',
                                      style: TextFontStyle
                                          .textStyle14C808080GSR400,
                                    ),
                                    Text(
                                      '- \$ ${checkoutState.discountAmount.toStringAsFixed(2)}',
                                      style: TextFontStyle
                                          .textStyle14C1A1A1AGSR500
                                          .copyWith(
                                              color: AppColors.c0C9409),
                                    ),
                                  ],
                                ),
                              ),
                           UIHelper.verticalSpace(10.h),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final isNarrow = constraints.maxWidth < 360.w;
                                if (isNarrow) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: CustomFormField(
                                              controller: promoController,
                                              hintText: 'Enter promo code',
                                              prefixIcon: Image.asset(
                                                Assets.icons.discountCard.path,
                                                height: 18.h,
                                                width: 18.w,
                                                color: AppColors.c808080,
                                              ),
                                              borderRadius: 26.r,
                                              fillColor: AppColors.cFFFFFF,
                                              enableBorderColor: AppColors.cE6E6E6,
                                              focusBorderColor: AppColors.cE6E6E6,
                                            ),
                                          ),
                                            UIHelper.horizontalSpace(10.h),
                                          Expanded(
                                            flex: 2,
                                            child: CustomButton(
                                                                                    onTap: () {
                                            if (promoController
                                                .text.isNotEmpty) {
                                              context
                                                  .read<CheckOutBloc>()
                                                  .add(
                                                    ApplyPromoCodeEvent(
                                                      promoCode:
                                                          promoController.text,
                                                    ),
                                                  );
                                            }
                                                                                    },
                                                                                    btnName: 'Add',
                                                                                    height: 50.h,
                                                                                    borderRadius: 26.r,
                                                                                    bgColor: AppColors.c1A1A1A,
                                                                                  ),
                                          ),
                                        ],
                                      ),
                          
       
                                      
                                    ],
                                  );
                                }

                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: CustomFormField(
                                        controller: promoController,
                                        hintText: 'Enter promo code',
                                        prefixIcon: Image.asset(
                                          Assets.icons.discountCard.path,
                                          height: 18.h,
                                          width: 18.w,
                                          color: AppColors.c808080,
                                        ),
                                        borderRadius: 26.r,
                                        fillColor: AppColors.cFFFFFF,
                                        enableBorderColor: AppColors.cE6E6E6,
                                        focusBorderColor: AppColors.cE6E6E6,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(10.w),
                                    Expanded(
                                      flex: 1,
                                      child: CustomButton(
                                        onTap: () {
                                          if (promoController
                                              .text.isNotEmpty) {
                                            context
                                                .read<CheckOutBloc>()
                                                .add(
                                                  ApplyPromoCodeEvent(
                                                    promoCode:
                                                        promoController.text,
                                                  ),
                                                );
                                          }
                                        },
                                        btnName: 'Add',
                                        height: 50.h,
                                        borderRadius: 26.r,
                                        bgColor: AppColors.c1A1A1A,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            if (checkoutState.errorMessage != null)
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: Text(
                                  checkoutState.errorMessage!,
                                  style: TextFontStyle
                                      .textStyle12C808080GSR400
                                      .copyWith(color: AppColors.cED1010),
                                ),
                              ),
                            UIHelper.verticalSpace(20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
                    child: CustomButton(
                      onTap: () {
                        context
                            .read<CheckOutBloc>()
                            .add(PlaceOrderEvent());
                        NavigationService.navigateTo(
                          Routes.paymentValidationScreen,
                        );
                      },
                      btnName: 'Place Order',
                      height: 54.h,
                      borderRadius: 30.r,
                      bgColor: AppColors.c1A1A1A,
                      isLoading:
                          checkoutState.status == CheckOutStatus.loading,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

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
      UIHelper.verticalSpace(16.h),

          Text(
            'Your Cart Is Empty!',
            style: TextFontStyle.textStyle20C1A1A1AGSS600.copyWith(
              color: AppColors.c808080,
            ),
          ),
       UIHelper.verticalSpace(10.h),
          Text(
            "When you add products, they'll appear here.",
            style: TextFontStyle.textStyle14C808080GSR400,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextFontStyle.textStyle16C1A1A1AGSS600,
        ),
        if (actionLabel != null)
          InkWell(
            onTap: onAction,
            child: Text(
              actionLabel!,
              style: TextFontStyle.textStyle14C1A1A1AGSR500.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String title;
  final String address;

  const _AddressCard({
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.cE6E6E6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.icons.location.path,
            height: 18.h,
            width: 18.w,
            color: AppColors.c1A1A1A,
          ),
          UIHelper.horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextFontStyle.textStyle14C1A1A1AGSS600,
                ),
               UIHelper.verticalSpace(3.h),
               
                Text(
                  address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextFontStyle.textStyle12C808080GSR400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color contentColor =
        isSelected ? AppColors.cFFFFFF : AppColors.c1A1A1A;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.c1A1A1A : AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
            color: isSelected ? AppColors.c1A1A1A : AppColors.cE6E6E6,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 16.h,
              width: 16.w,
              color: contentColor,
            ),
            UIHelper.horizontalSpace(6.w),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextFontStyle.textStyle12C1A1A1ADGSS600.copyWith(
                  color: contentColor,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
