import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textform_field.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'bloc/my_details_bloc.dart';
import 'bloc/my_details_event.dart';
import 'bloc/my_details_state.dart';

class MyDetailsScreen extends StatelessWidget {
  MyDetailsScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final detailsBloc = context.read<MyDetailsBloc>();
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      detailsBloc.add(MyDetailsDateChanged(date));
    }
  }

  Future<void> _showCountryPicker(
    BuildContext context,
    CountryOption selectedCountry,
  ) async {
    final detailsBloc = context.read<MyDetailsBloc>();
    final selected = await showModalBottomSheet<CountryOption>(
      context: context,
      backgroundColor: AppColors.cFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Country',
                    style: TextFontStyle.textStyle16C1A1A1AGSS600,
                  ),
                  UIHelper.verticalSpace(12.h),
                  SizedBox(
                    height: 0.6.sh,
                    child: ListView.separated(
                      itemCount: MyDetailsBloc.countryOptions.length,
                      separatorBuilder: (_, __) =>
                          Divider(color: AppColors.cE6E6E6, height: 1.h),
                      itemBuilder: (context, index) {
                        final country = MyDetailsBloc.countryOptions[index];
                        final isSelected = country == selectedCountry;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            country.flag,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          title: Text(
                            country.name,
                            style: TextFontStyle.textStyle14C1A1A1AGSR500,
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check,
                                  color: AppColors.c1A1A1A)
                              : Text(
                                  country.dialCode,
                                  style: TextFontStyle.textStyle14C808080GSR400,
                                ),
                          onTap: () => Navigator.pop(sheetContext, country),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (selected != null) {
      detailsBloc.add(MyDetailsCountryChanged(selected));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyDetailsBloc(),
      child: BlocConsumer<MyDetailsBloc, MyDetailsState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == MyDetailsStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'Please check your details',
                ),
              ),
            );
          }

          if (state.status == MyDetailsStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Details saved!')),
            );
          }
        },
        builder: (context, state) {
          final detailsBloc = context.read<MyDetailsBloc>();
          return CustomScaffold(
            appBar: CustomAppBar(
              height: 50.h,
              title: "My Details",
              actionWidgets: [
                GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(Routes.notificationScreen);
                    },
                    child: Image.asset(Assets.icons.notification.path,
                        height: 24.h, width: 24.w)),
                UIHelper.horizontalSpace(20.w),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(color: AppColors.cE6E6E6, height: 1.h),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Full Name',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: detailsBloc.nameController,
                        hintText: 'Enter your full name',
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Email Address',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: detailsBloc.emailController,
                        hintText: 'Enter your email',
                        inputType: TextInputType.emailAddress,
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Date of Birth',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: detailsBloc.dateController,
                        hintText: 'DD/MM/YYYY',
                        isDatePicker: true,
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                        onDateTap: () => _selectDate(context),
                      ),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Gender',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        isDropdown: true,
                        dropdownItems: const ['Male', 'Female', 'Other'],
                        selectedDropdownValue: state.selectedGender,
                        onDropdownChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          context
                              .read<MyDetailsBloc>()
                              .add(MyDetailsGenderChanged(value));
                        },
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                      ),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Phone Number',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: detailsBloc.phoneController,
                        isPhoneField: true,
                        countryCode: state.selectedCountry.flag,
                        hintText: 'Phone number',
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9 +]'),
                          ),
                        ],
                        onCountryCodeTap: () =>
                            _showCountryPicker(context, state.selectedCountry),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(24.h),
                      CustomButton(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context
                                .read<MyDetailsBloc>()
                                .add(const MyDetailsSubmitted());
                          }
                        },
                        btnName: 'Submit',
                        height: 54.h,
                        borderRadius: 12.r,
                      ),
                      UIHelper.verticalSpace(24.h),
                    ],
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
