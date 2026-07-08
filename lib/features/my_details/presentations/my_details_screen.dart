import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textform_field.dart';
import '../../../common_widgets/shimmer.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'bloc/mydetails_bloc.dart';
import 'bloc/mydetails_event.dart';
import 'bloc/mydetails_state.dart';

class MyDetailsScreen extends StatelessWidget {
  MyDetailsScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyDetailsBloc(),
      child: BlocBuilder<MyDetailsBloc, MyDetailsState>(
        builder: (context, state) {
          final bloc = context.read<MyDetailsBloc>();

          if (state.status == MyDetailsStatus.loading) {
            return CustomScaffold(
              appBar: CustomAppBar(
                height: 50.h,
                title: "My Details",
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer(
                              child: Container(
                                width: 100.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            UIHelper.verticalSpace(8.h),
                            Shimmer(
                              child: Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          }

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
                        'Bio',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: bloc.bioController,
                        hintText: 'Enter your bio',
                        maxline: 3,
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Location',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: bloc.locationController,
                        hintText: 'Enter your location',
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Website',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: bloc.websiteController,
                        hintText: 'Enter your website URL',
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
                        controller: bloc.phoneController,
                        hintText: 'Phone number',
                        inputType: TextInputType.phone,
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 0, maxWidth: 120.w),
                        prefixIconPadding:
                            EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                        prefixIcon: GestureDetector(
                          onTap: () => _pickCountry(context, state, bloc),
                          behavior: HitTestBehavior.translucent,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.selectedCountry.flag,
                                  style: TextFontStyle.textStyle16C1A1A1ADGSM500,
                                ),
                                UIHelper.horizontalSpace(6.w),
                                Text(
                                  state.selectedCountry.dialCode,
                                  style: TextFontStyle.textStyle12C808080GSM500,
                                ),
                                UIHelper.horizontalSpace(4.w),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.c1A1A1A,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Gender',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () => _pickGender(context, state, bloc),
                        behavior: HitTestBehavior.translucent,
                        child: AbsorbPointer(
                          child: CustomFormField(
                            controller: bloc.genderController,
                            isRead: true,
                            borderRadius: 12.r,
                            enableBorderColor: AppColors.cE6E6E6,
                            focusBorderColor: AppColors.cE6E6E6,
                            fillColor: AppColors.cFFFFFF,
                            suffixIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.c1A1A1A,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Date of Birth',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      GestureDetector(
                        onTap: () => _pickDate(context, bloc),
                        behavior: HitTestBehavior.translucent,
                        child: AbsorbPointer(
                          child: CustomFormField(
                            controller: bloc.dateController,
                            hintText: 'DD/MM/YYYY',
                            isRead: true,
                            borderRadius: 12.r,
                            enableBorderColor: AppColors.cE6E6E6,
                            focusBorderColor: AppColors.cE6E6E6,
                            fillColor: AppColors.cFFFFFF,
                            suffixIcon: Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.c999999,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Facebook Profile',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: bloc.facebookController,
                        hintText: 'Enter Facebook profile URL',
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                      ),
                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Instagram Profile',
                        style: TextFontStyle.textStyle14C1A1A1AGSS600,
                      ),
                      UIHelper.verticalSpace(8.h),
                      CustomFormField(
                        controller: bloc.instagramController,
                        hintText: 'Enter Instagram profile URL',
                        borderRadius: 12.r,
                        enableBorderColor: AppColors.cE6E6E6,
                        focusBorderColor: AppColors.cE6E6E6,
                        fillColor: AppColors.cFFFFFF,
                      ),
                      UIHelper.verticalSpace(24.h),

                      CustomButton(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            bloc.add(const SubmitProfile());
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

  Future<void> _pickDate(
    BuildContext context,
    MyDetailsBloc bloc,
  ) async {
    final now = DateTime.now();
    final initialDate = bloc.tryParseDate(bloc.dateController.text) ?? now;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isAfter(now) ? now : initialDate,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null && context.mounted) {
      bloc.add(MyDetailsDateSelected(picked));
    }
  }

  void _pickGender(
    BuildContext context,
    MyDetailsState state,
    MyDetailsBloc bloc,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shadowColor: AppColors.cFFFFFF,
          title: const Text('Select Gender'),
          children: state.genderOptions.map((option) {
            final isSelected = option == state.selectedGender;
            return SimpleDialogOption(
              onPressed: () {
                bloc.add(MyDetailsGenderSelected(option));
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: AppColors.c1A1A1A,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(option),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void _pickCountry(
    BuildContext context,
    MyDetailsState state,
    MyDetailsBloc bloc,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.countries.length,
            separatorBuilder: (_, __) => Divider(height: 1.h),
            itemBuilder: (context, index) {
              final country = state.countries[index];
              return ListTile(
                leading: Text(country.flag),
                title: Text(country.name),
                subtitle: Text(country.dialCode),
                trailing: country == state.selectedCountry
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  bloc.add(MyDetailsCountrySelected(country));
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }
}
