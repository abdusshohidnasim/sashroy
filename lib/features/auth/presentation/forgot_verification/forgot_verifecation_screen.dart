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
import 'bloc/reset_verification_bloc.dart';
import 'bloc/reset_verification_event.dart';
import 'bloc/reset_verification_state.dart';

class ResetVerifecationScreen extends StatelessWidget {
  const ResetVerifecationScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final routeEmail = ModalRoute.of(context)?.settings.arguments as String?;
    final effectiveEmail = email ?? routeEmail;

    return BlocProvider<ResetVerificationBloc>(
      create: (_) => ResetVerificationBloc(),
      child: CustomScaffold(
        appBar: const CustomAppBar(),
        body: BlocConsumer<ResetVerificationBloc, ResetVerificationState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == ResetVerificationStatus.success) {
              NavigationService.navigateTo(Routes.forgotSetPasswordScreen);
            } else if (state.status == ResetVerificationStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Verification failed.'),
                ),
              );
            }
          },
          builder: (context, state) {
            final verificationBloc = context.read<ResetVerificationBloc>();

            final defaultPinTheme = PinTheme(
              width: 48.w,
              height: 48.h,
              textStyle: TextFontStyle.textStyle16C1A1A1ADGSM500,
              decoration: BoxDecoration(
                color: AppColors.cE6E6E6,
                borderRadius: BorderRadius.circular(12.r),
                //border: Border.all(color: AppColors.cE6E6E6),
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
                                      text: effectiveEmail ?? 'your email',
                                      style: TextFontStyle
                                          .textStyle16C1A1A1ADGSM500,
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
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                      border: Border.all(
                                        color: AppColors.c1A1A1A,
                                      ),
                                    ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                      border: Border.all(
                                        color: AppColors.c1A1A1A,
                                      ),
                                    ),
                              ),
                              errorPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                      border: Border.all(
                                        color: AppColors.cD70808,
                                      ),
                                    ),
                              ),
                              onChanged: (value) {
                                context.read<ResetVerificationBloc>().add(
                                      ResetVerificationCodeChanged(code: value),
                                    );
                              },
                            ),
                            UIHelper.verticalSpace(24.h),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Email not received? ',
                                  style:
                                      TextFontStyle.textStyle14C808080GSR400,
                                  children: [
                                    TextSpan(
                                      text: state.resendSecondsRemaining > 0
                                          ? ' ${state.resendSecondsRemaining}s'
                                          : 'Resend Code',
                                      style: state.resendSecondsRemaining > 0
                                          ? TextFontStyle
                                              .textStyle14C1A1A1ADGSM500
                                          : TextFontStyle
                                              .textStyle14C1A1A1ADGSM500
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                      recognizer: state.resendSecondsRemaining > 0
                                          ? null
                                          : (TapGestureRecognizer()
                                            ..onTap = () {
                                              context
                                                  .read<ResetVerificationBloc>()
                                                  .add(
                                                    ResetVerificationResendRequested(
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
                              isLoading: state.status ==
                                  ResetVerificationStatus.loading,
                              bgColor: state.code.length == 6
                                  ? AppColors.c1A1A1A
                                  : AppColors.cCCCCCC,
                              onTap: () {
                                final isValid = verificationBloc
                                        .formKey.currentState
                                        ?.validate() ??
                                    false;
                                if (!isValid) return;

                                context.read<ResetVerificationBloc>().add(
                                      ResetVerificationSubmitted(
                                        code: verificationBloc
                                            .pinController.text,
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
