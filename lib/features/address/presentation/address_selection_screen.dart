import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'bloc/address_bloc.dart';
import 'bloc/address_event.dart';
import 'bloc/address_state.dart';
import '../model/address_model.dart';
import '../../add_address/presentation/add_address_screen.dart';

class AddressSelectionScreen extends StatelessWidget {
  const AddressSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressBloc()..add(LoadAddressesEvent()),
      child: const _AddressSelectionView(),
    );
  }
}

class _AddressSelectionView extends StatelessWidget {
  const _AddressSelectionView();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: "Address",
        height: 60.h,
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.status == AddressStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.c1A1A1A,
              ),
            );
          }

          if (state.status == AddressStatus.error) {
            return Center(
              child: Text(
                state.errorMessage ?? 'Error loading addresses',
                style: TextFontStyle.textStyle14C808080GSR400,
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomDivider(),
                        UIHelper.verticalSpace(16.h),
                        Text(
                          'Saved Address',
                          style: TextFontStyle.textStyle16C1A1A1AGSS600,
                        ),
                        UIHelper.verticalSpace(12.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.addresses.length,
                          itemBuilder: (context, index) {
                            final address = state.addresses[index];
                            final isSelected =
                                state.selectedAddressId == address.id;

                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: _AddressCard(
                                address: address,
                                isSelected: isSelected,
                                onTap: () {
                                  context.read<AddressBloc>().add(
                                        SelectAddressEvent(
                                          addressId: address.id,
                                        ),
                                      );
                                },
                                onSetDefault: () {
                                  context.read<AddressBloc>().add(
                                        SetDefaultAddressEvent(
                                          addressId: address.id,
                                        ),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                        UIHelper.verticalSpace(12.h),
                        _AddNewAddressButton(
                          onTap: () {
                            final addressBloc = context.read<AddressBloc>();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddAddressScreen(addressBloc: addressBloc),
                              ),
                            );
                          },
                        ),
                        UIHelper.verticalSpace(24.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
                child: CustomButton(
                  onTap: () {
                    if (state.selectedAddress != null) {
                      context.read<AddressBloc>().add(
                            ApplyAddressEvent(
                              address: state.selectedAddress!,
                            ),
                          );
                      Navigator.pop(context, state.selectedAddress);
                    }
                  },
                  btnName: 'Apply',
                  height: 54.h,
                  borderRadius: 30.r,
                  bgColor: AppColors.c1A1A1A,
                  isLoading:
                      state.status == AddressStatus.loading,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onSetDefault;

  const _AddressCard({ 
    required this.address,
    required this.isSelected,
    required this.onTap,
    required this.onSetDefault,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.c1A1A1A : AppColors.cE6E6E6,
            width: isSelected ? 2.w : 1.w,
          ),
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
                  Row(
                    children: [
                      Text(
                        address.title,
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      if (address.isDefault) ...[
                        UIHelper.horizontalSpace(6.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cE6E6E6,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'Default',
                            style: TextFontStyle.textStyle9CFFFFFFPoppins400
                                .copyWith(
                              color: AppColors.c1A1A1A,
                              fontSize: 9.sp,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  UIHelper.verticalSpace(3.h),
                  Text(
                    address.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextFontStyle.textStyle12C808080GSR400,
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(8.w),
            _RadioButton(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _RadioButton extends StatelessWidget {
  final bool isSelected;

  const _RadioButton({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.c1A1A1A : AppColors.cCCCCCC,
          width: 2.w,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 14.w,
                height: 14.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.c1A1A1A,
                ),
              ),
            )
          : null,
    );
  }
}

class _AddNewAddressButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddNewAddressButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.cE6E6E6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 20.sp,
              color: AppColors.c1A1A1A,
            ),
            UIHelper.horizontalSpace(8.w),
            Text(
              'Add New Address',
              style: TextFontStyle.textStyle14C1A1A1AGSR500,
            ),
          ],
        ),
      ),
    );
  }
}
