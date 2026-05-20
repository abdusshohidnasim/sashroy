import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/features/auth/presentation/sign_up_email/bloc/sign_up_email_bloc.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../../common_widgets/common_auth_text.dart';

import 'bloc/sign_up_email_state.dart';

class SignUpEmailScreen extends StatelessWidget {
  const SignUpEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpEmailBloc>(
      create: (BuildContext context) => SignUpEmailBloc(),
      child: CustomScaffold(
        appBar: const CustomAppBar(backgroundColor: AppColors.cFFFFFF),
        body: BlocConsumer<SignUpEmailBloc, SignUpEmailState>(
            listener: (context, state) {
          if (state.status == SignUpEmailStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email sent successfully!')),
            );
          } else if (state.status == SignUpEmailStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Failed to send email. Please try again.')),
            );
          }
        }, builder: (context, state) {
          final signUpEmailBloc = context.read<SignUpEmailBloc>();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: signUpEmailBloc.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CommonAuthText(
                      text: 'Forgot password',
                      buttontext:
                          'Enter your email for the verification process. We will send 4 digits code to your email.',
                    ),
                    UIHelper.verticalSpace(24.h),
                    _buildTextforomfileName(
                      'Email ',
                    ),
                    UIHelper.verticalSpace(5.h),
                    CustomFormField(
                      validator: emailValidator,
                      textInputAction: TextInputAction.next,
                      controller: signUpEmailBloc.emailController,
                      fillColor: AppColors.cFFFFFF,
                      enableBorderColor: AppColors.cE6E6E6,
                      hintText: "Enter your email address",
                    ),
                    UIHelper.verticalSpace(24.h),
                    AnimatedBuilder(
                      animation: Listenable.merge([
                        signUpEmailBloc.emailController,
                      ]),
                      builder: (context, child) {
                        final emailText = signUpEmailBloc.emailController.text;

                        final isEnabled = emailValidator(emailText) == null;

                        return CustomButton(
                          isLoading: state.status == SignUpEmailStatus.loading,
                          bgColor:
                              isEnabled ? AppColors.c1A1A1A : AppColors.cCCCCCC,
                          onTap: () {
                            NavigationService.navigateTo(
                                Routes.signUpVerificationScreen);
                            // final isValid = forgotPasswordBloc
                            //         .formKey.currentState
                            //         ?.validate() ??
                            //     false;
                            // if (!isValid) return;

                            // forgotPasswordBloc.add(
                            //   ForgotPasswordEmailButtonPressed(
                            //     email: emailText,
                            //   ),
                            // );
                          },
                          btnName: "Send Code",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTextforomfileName(String text) {
    return Text(text,
        style: TextFontStyle.textStyle16CFFFFFFGSM500
            .copyWith(color: AppColors.c1A1A1A));
  }
}
