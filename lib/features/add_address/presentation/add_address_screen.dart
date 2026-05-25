import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/common_sucessfull_dilog.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import '../../address/presentation/bloc/address_bloc.dart';
import 'bloc/add_address_bloc.dart';
import 'bloc/add_address_event.dart';
import 'bloc/add_address_state.dart';

class AddAddressScreen extends StatelessWidget {
  final AddressBloc addressBloc;

  const AddAddressScreen({
    super.key,
    required this.addressBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAddressBloc>(
      create: (_) => AddAddressBloc(addressBloc: addressBloc),
      child: BlocConsumer<AddAddressBloc, AddAddressState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == AddAddressStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'Please enter a full address',
                ),
              ),
            );
          }

          if (state.status == AddAddressStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Address "${state.selectedNickname}" added successfully',
                ),
              ),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          final addAddressBloc = context.read<AddAddressBloc>();
          return CustomScaffold(
            appBar: CustomAppBar(
              title: 'New Address',
              height: 60.h,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpace(10.h),
                          Text(
                            'Address',
                            style: TextFontStyle.textStyle16C1A1A1AGSS600,
                          ),
                          UIHelper.verticalSpace(16.h),
                          Text(
                            'Address Nickname',
                            style: TextFontStyle.textStyle14C1A1A1AGSS600,
                          ),
                          UIHelper.verticalSpace(8.h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.cE6E6E6),
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.cFFFFFF,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: state.selectedNickname,
                                isExpanded: true,
                                items: state.availableNicknames
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                      ),
                                      child: Text(
                                        value,
                                        style: TextFontStyle
                                            .textStyle14C1A1A1AGSR500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    addAddressBloc.add(
                                      AddAddressNicknameChanged(newValue),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          UIHelper.verticalSpace(20.h),
                          Text(
                            'Full Address',
                            style: TextFontStyle.textStyle14C1A1A1AGSS600,
                          ),
                          UIHelper.verticalSpace(8.h),
                          TextField(
                            controller: addAddressBloc.fullAddressController,
                            maxLines: 3,
                            minLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Enter your full address',
                              hintStyle: TextFontStyle.textStyle14C808080GSR400,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: AppColors.cE6E6E6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: AppColors.cE6E6E6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: AppColors.c1A1A1A),
                              ),
                              contentPadding: EdgeInsets.all(12.w),
                              fillColor: AppColors.cFFFFFF,
                              filled: true,
                            ),
                            style: TextFontStyle.textStyle14C1A1A1AGSR500,
                          ),
                          UIHelper.verticalSpace(16.h),
                          GestureDetector(
                            onTap: () {
                              addAddressBloc.add(
                                const AddAddressToggleDefault(),
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: state.makeDefault
                                          ? AppColors.c1A1A1A
                                          : AppColors.cCCCCCC,
                                      width: 2.w,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: state.makeDefault
                                        ? AppColors.c1A1A1A
                                        : AppColors.cFFFFFF,
                                  ),
                                  child: state.makeDefault
                                      ? Icon(
                                          Icons.check,
                                          size: 14.sp,
                                          color: AppColors.cFFFFFF,
                                        )
                                      : null,
                                ),
                                UIHelper.horizontalSpace(10.w),
                                Text(
                                  'Make this as a default address',
                                  style: TextFontStyle.textStyle14C808080GSR400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
                  child: CustomButton(
                    onTap: () {
                      CommonSucessfullDilog.show(
                          context: context,
                          onTap: () {
                   
                            NavigationService.navigateToReplacement(Routes.addressSelectionScreen);
                          },
                          btnName: "Thanks",
                          bigtext: "Congratulations!",
                          buttomtext: "Your new address has been added.");
                      // addAddressBloc.add(const AddAddressSubmit());
                    },
                    btnName: 'Add',
                    height: 54.h,
                    borderRadius: 30.r,
                    bgColor: AppColors.c1A1A1A,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
