import 'package:flutter/material.dart';
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

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();
  final _phoneController = TextEditingController();

  // String _selectedGender = 'Male';
  // final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  // final String _selectedCountryCode = '🇺🇸';

  @override
  void initState() {
    _nameController.text = 'Cody Fisher';
    _emailController.text = 'cody.fisher45@example';
    _dateController.text = '12/07/1990';
    _phoneController.text = '+1 234 453 231 506';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  'Full Name',
                  style: TextFontStyle.textStyle14C1A1A1AGSS600,
                ),
                UIHelper.verticalSpace(8.h),
                CustomFormField(
                  controller: _nameController,
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
                  controller: _emailController,
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
                // CustomFormField(
                //   controller: _dateController,
                //   hintText: 'DD/MM/YYYY',
                //   isDatePicker: true,
                //   borderRadius: 12.r,
                //   enableBorderColor: AppColors.cE6E6E6,
                //   focusBorderColor: AppColors.cE6E6E6,
                //   fillColor: AppColors.cFFFFFF,
                //   onDateTap: () async {
                //     final date = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime(2000),
                //       firstDate: DateTime(1950),
                //       lastDate: DateTime.now(),
                //     );
                //     if (date != null) {
                //       _dateController.text =
                //           '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
                //     }
                //   },
                // ),
                UIHelper.verticalSpace(16.h),

                Text(
                  'Gender',
                  style: TextFontStyle.textStyle14C1A1A1AGSS600,
                ),
                UIHelper.verticalSpace(8.h),
                // CustomFormField(
                //   isDropdown: true,
                //   dropdownItems: _genderOptions,
                //   selectedDropdownValue: _selectedGender,
                //   onDropdownChanged: (value) {
                //     if (value == null) {
                //       return;
                //     }
                //     setState(() => _selectedGender = value);
                //   },
                //   borderRadius: 12.r,
                //   enableBorderColor: AppColors.cE6E6E6,
                //   focusBorderColor: AppColors.cE6E6E6,
                //   fillColor: AppColors.cFFFFFF,
                // ),
                UIHelper.verticalSpace(16.h),

                Text(
                  'Phone Number',
                  style: TextFontStyle.textStyle14C1A1A1AGSS600,
                ),
                UIHelper.verticalSpace(8.h),
                // CustomFormField(
                //   controller: _phoneController,
                //   isPhoneField: true,
                //   countryCode: _selectedCountryCode,
                //   hintText: 'Phone number',
                //   borderRadius: 12.r,
                //   enableBorderColor: AppColors.cE6E6E6,
                //   focusBorderColor: AppColors.cE6E6E6,
                //   fillColor: AppColors.cFFFFFF,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.allow(RegExp(r'[0-9 +]')),
                //   ],
                //   onCountryCodeTap: () {
  
                //   },
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your phone number';
                //     }
                //     return null;
                //   },
                // ),
                UIHelper.verticalSpace(24.h),

                CustomButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Details saved!')),
                      );
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
  }
}
