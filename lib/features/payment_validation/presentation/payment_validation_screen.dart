import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_divider.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import 'bloc/payment_bloc.dart';
import 'bloc/payment_event.dart';
import 'bloc/payment_stat.dart';

class PaymentValidationScreen extends StatelessWidget {
  const PaymentValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentBloc>(
      create: (_) => PaymentBloc(),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == PaymentValidationStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.errorMessage ?? 'Validation failed')),
            );
          }
        },
        builder: (context, state) {
          final paymentBloc = context.read<PaymentBloc>();
          return CustomScaffold(
            appBar: CustomAppBar(
              title: 'Payment Validation',
              height: 60.h,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  const CustomDivider(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Form(
                          key: paymentBloc.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIHelper.verticalSpace(10.h),
                              Text(
                                'Transaction ID (TXID)',
                                style: TextFontStyle.textStyle16C1A1A1AGSS600,
                              ),
                              UIHelper.verticalSpace(8.h),
                              CustomFormField(
                                controller: paymentBloc.txIdController,
                                hintText: 'JH3HDJHSDJU',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a transaction ID';
                                  }
                                  return null;
                                },
                                fillColor: AppColors.cFFFFFF,
                                enableBorderColor: AppColors.cE6E6E6,
                                focusBorderColor: AppColors.cE6E6E6,
                                borderRadius: 12.r,
                              ),
                              UIHelper.verticalSpace(16.h),
                              Text(
                                'Phone Number',
                                style: TextFontStyle.textStyle16C1A1A1AGSS600,
                              ),
                              UIHelper.verticalSpace(8.h),
                              CustomFormField(
                                controller: paymentBloc.phoneController,
                                hintText: '01xxxxxxxxx',
                                inputType: TextInputType.phone,
                                validator: validatePhoneNumber,
                                fillColor: AppColors.cFFFFFF,
                                enableBorderColor: AppColors.cE6E6E6,
                                focusBorderColor: AppColors.cE6E6E6,
                                borderRadius: 12.r,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
                    child: CustomButton(
                      onTap: () {
                        paymentBloc.add(const PaymentValidationSubmitted());
                      },
                      btnName: 'Confirm',
                      height: 54.h,
                      borderRadius: 30.r,
                      bgColor: AppColors.c1A1A1A,
                      isLoading:
                          state.status == PaymentValidationStatus.submitting,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
