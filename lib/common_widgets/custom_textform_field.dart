import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

final class CustomFormField extends StatefulWidget {
  final String? hintText;
  final double? hintFontSize;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final double? fieldHeight;
  final int? maxline;
  final int? minline;
  final String? Function(String?)? validator;
  final bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObsecure;
  final bool isPass;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final bool isRead;
  final double? borderRadius;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final TextStyle? hintsTextStyle;
  final AutovalidateMode? autovalidateMode;
  final bool isDatePicker;
  final VoidCallback? onDateTap;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final Function(String?)? onDropdownChanged;
  final String? selectedDropdownValue;
  final bool isPhoneField;
  final String? countryCode;
  final VoidCallback? onCountryCodeTap;

  const CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.inputType,
    this.fieldHeight,
    this.maxline,
    this.minline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.isRead = false,
    this.borderRadius,
    this.hintFontSize,
    this.enableBorderColor,
    this.focusBorderColor,
    this.fillColor,
    this.hintsTextStyle,
    this.autovalidateMode,
    this.isDatePicker = false,
    this.onDateTap,
    this.isDropdown = false,
    this.dropdownItems,
    this.onDropdownChanged,
    this.selectedDropdownValue,
    this.isPhoneField = false,
    this.countryCode,
    this.onCountryCodeTap,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDropdown) {
      return _buildDropdownField();
    }

    if (widget.isDatePicker) {
      return _buildDatePickerField();
    }

    if (widget.isPhoneField) {
      return _buildPhoneField();
    }

    return _buildDefaultField();
  }

  Widget _buildDefaultField() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: TextFormField(
          readOnly: widget.isRead,
          cursorHeight: widget.cursorHeight ?? 20.h,
          cursorColor: AppColors.c1A1A1A,
          focusNode: widget.focusNode,
          obscureText: widget.isPass ? _isObscure : false,
          textInputAction: widget.textInputAction,
          autovalidateMode: widget.validation!
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          maxLines: widget.maxline ?? 1,
          minLines: widget.minline ?? 1,
          controller: widget.controller,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          enabled: widget.isEnabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            isDense: true,
            suffixIcon: widget.isPass
                ? _buildPasswordToggle()
                : widget.suffixIcon,
            prefixIcon: widget.prefixIcon != null
                ? Padding(padding: EdgeInsets.all(12.sp), child: widget.prefixIcon)
                : null,
            hintText: widget.hintText,
            hintStyle: widget.hintsTextStyle ??
                TextFontStyle.textStyle16C808080GSR400
                    .copyWith(color: AppColors.c999999),
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            errorStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.red),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(color: Colors.red, width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(
                color: widget.focusBorderColor ?? AppColors.cE6E6E6,
                width: 1.w,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(
                color: widget.disableColor ?? AppColors.cE6E6E6,
                width: 1.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(
                color: widget.enableBorderColor ??
                    AppColors.cFFFFFF.withValues(alpha: 0.1),
                width: 1.w,
              ),
            ),
          ),
          style: widget.style ?? TextFontStyle.textStyle16C1A1A1ADGSM500,
          keyboardType: widget.inputType,
        ),
      ),
    );
  }

  Widget _buildPasswordToggle() {
    return GestureDetector(
      onTap: () => setState(() => _isObscure = !_isObscure),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Icon(
          _isObscure ? Icons.visibility_off : Icons.visibility,
          color: AppColors.c808080,
          size: 20.sp,
        ),
      ),
    );
  }

  Widget _buildDatePickerField() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: TextFormField(
          readOnly: true,
          controller: widget.controller,
          validator: widget.validator,
          onTap: widget.onDateTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            isDense: true,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Icon(
                Icons.calendar_today_outlined,
                color: AppColors.c808080,
                size: 20.sp,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintsTextStyle ??
                TextFontStyle.textStyle16C808080GSR400
                    .copyWith(color: AppColors.c999999),
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            errorStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.red),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(
                color: widget.focusBorderColor ?? AppColors.cE6E6E6,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
              borderSide: BorderSide(
                color: widget.enableBorderColor ??
                    AppColors.cFFFFFF.withValues(alpha: 0.1),
                width: 1.w,
              ),
            ),
          ),
          style: widget.style ?? TextFontStyle.textStyle16C1A1A1ADGSM500,
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
            border: Border.all(
              color: widget.enableBorderColor ??
                  AppColors.cFFFFFF.withValues(alpha: 0.1),
              width: 1.w,
            ),
          ),
          child: DropdownButtonFormField<String>(
            initialValue: widget.selectedDropdownValue,
            onChanged: widget.onDropdownChanged,
            validator: widget.validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide(
                  color: widget.focusBorderColor ?? AppColors.cE6E6E6,
                  width: 1.w,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: widget.hintsTextStyle ??
                  TextFontStyle.textStyle16C808080GSR400
                      .copyWith(color: AppColors.c999999),
              labelText: widget.labelText,
              labelStyle: widget.labelStyle,
            ),
            items: (widget.dropdownItems ?? [])
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: widget.style ??
                            TextFontStyle.textStyle16C1A1A1ADGSM500,
                      ),
                    ))
                .toList(),
            style: widget.style ?? TextFontStyle.textStyle16C1A1A1ADGSM500,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.c808080,
              size: 24.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: widget.onCountryCodeTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                    border: Border.all(
                      color: widget.enableBorderColor ??
                          AppColors.cFFFFFF.withValues(alpha: 0.1),
                      width: 1.w,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.countryCode ?? '🇺🇸',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.c808080,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              flex: 4,
              child: TextFormField(
                readOnly: widget.isRead,
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                inputFormatters: widget.inputFormatters ??
                    [FilteringTextInputFormatter.digitsOnly],
                validator: widget.validator,
                textInputAction: widget.textInputAction,
                onFieldSubmitted: widget.onFieldSubmitted,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.fillColor,
                  isDense: true,
                  hintText: widget.hintText ?? 'Phone number',
                  hintStyle: widget.hintsTextStyle ??
                      TextFontStyle.textStyle16C808080GSR400
                          .copyWith(color: AppColors.c999999),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8.r),
                    borderSide: BorderSide(
                      color: widget.enableBorderColor ??
                          AppColors.cFFFFFF.withValues(alpha: 0.1),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 8.r),
                    borderSide: BorderSide(
                      color: widget.focusBorderColor ?? AppColors.cE6E6E6,
                      width: 1.w,
                    ),
                  ),
                ),
                style: widget.style ?? TextFontStyle.textStyle16C1A1A1ADGSM500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
