import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';

import '../../../../common_widgets/common_auth_text.dart';
import 'bloc/sign_up_verification_bloc.dart';
import 'bloc/sign_up_verification_event.dart';
import 'bloc/sign_up_verification_state.dart';

class SignUpVerifyEmailScreen extends StatelessWidget {
  const SignUpVerifyEmailScreen({super.key, this.email});

  final String? email;

  String maskEmail(String? email) {
    if (email == null || !email.contains('@')) return 'your email';
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];
    if (username.isEmpty) return email;

    final firstChar = username[0];
    final stars = '*' * (username.length - 1);
    return '$firstChar$stars@$domain';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpVerificationBloc>(
      create: (_) => SignUpVerificationBloc(),
      child: CustomScaffold( 
        appBar: const CustomAppBar(),
        body: BlocConsumer<SignUpVerificationBloc, SignUpVerificationState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == SignUpVerificationStatus.success) {
              NavigationService.navigateTo(Routes.loginScreen);
            } else if (state.status == SignUpVerificationStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Verification failed.'),
                ),
              );
            }
          },
          builder: (context, state) {
            final effectiveEmail = email ?? (ModalRoute.of(context)?.settings.arguments as Map?)?["email"];
            final verificationBloc = context.read<SignUpVerificationBloc>();

            final defaultPinTheme = PinTheme(
              width: 48.w,
              height: 48.h,
              textStyle: TextFontStyle.textStyle16C1A1A1ADGSM500,
              decoration: BoxDecoration(
                color: AppColors.cE6E6E6,
                borderRadius: BorderRadius.circular(12.r),
              ),
            );

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Form(
                        key: verificationBloc.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonAuthText(
                              text: 'Enter 6 Digit Code',
                              buttontext: 'Enter the 6-digit code sent to your',
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'email ',
                                  style: TextFontStyle.textStyle16C808080GSR400,
                                  children: [
                                    TextSpan(
                                      text: maskEmail(effectiveEmail),
                                      style: TextFontStyle.textStyle16C1A1A1ADGSM500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            UIHelper.verticalSpace(24.h),
                            UIHelper.verticalSpace(5.h),
                            Pinput(
                              length: 6,
                              controller: verificationBloc.pinController,
                              focusNode: verificationBloc.focusNode,
                              defaultPinTheme: defaultPinTheme,
                              separatorBuilder: (_) => SizedBox(width: 8.w),
                              validator: (value) {
                                if (value == null || value.length != 6) {
                                  return 'Enter 6 digit code';
                                }
                                return null;
                              },
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(color: AppColors.c1A1A1A),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(color: AppColors.c1A1A1A),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!.copyWith(
                                  border: Border.all(color: AppColors.cD70808),
                                ),
                              ),
                              onChanged: (value) {
                                context.read<SignUpVerificationBloc>().add(
                                      SignUpVerificationCodeChanged(code: value),
                                    );
                              },
                              onCompleted: (value) {
                                context.read<SignUpVerificationBloc>().add(
                                      SignUpVerificationCodeChanged(code: value),
                                    );
                              },
                            ),
                            UIHelper.verticalSpace(24.h),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Email not received? ',
                                  style: TextFontStyle.textStyle14C808080GSR400,
                                  children: [
                                    TextSpan(
                                      text: state.resendSecondsRemaining > 0
                                          ? ' ${state.resendSecondsRemaining}s'
                                          : 'Resend Code',
                                      style: state.resendSecondsRemaining > 0
                                          ? TextFontStyle.textStyle14C808080GSR400
                                          : TextFontStyle.textStyle14C1A1A1ADGSM500.copyWith(
                                              decoration: TextDecoration.underline,
                                            ),
                                      recognizer: state.resendSecondsRemaining > 0
                                          ? null
                                          : (TapGestureRecognizer()
                                            ..onTap = () {
                                              context.read<SignUpVerificationBloc>().add(
                                                    SignUpVerificationResendRequested(
                                                      email: effectiveEmail,
                                                    ),
                                                  );
                                            }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            UIHelper.verticalSpace(24.h),
                            CustomButton(
                              isLoading: state.status == SignUpVerificationStatus.loading,
                              bgColor: state.code.length == 6
                                  ? AppColors.c1A1A1A
                                  : AppColors.cCCCCCC,
                              onTap: () {
                                final isValid = verificationBloc.formKey.currentState?.validate() ?? false;
                                if (!isValid) return;

                                context.read<SignUpVerificationBloc>().add(
                                      SignUpVerificationSubmitted(
                                        code: verificationBloc.pinController.text,
                                        email: effectiveEmail,
                                      ),
                                    );
                              },
                              btnName: 'Continue',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}