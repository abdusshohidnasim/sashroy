import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_appbar.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../../common_widgets/common_auth_text.dart';
import '../../../../common_widgets/common_sucessfull_dilog.dart';
import '../../../../helpers/all_routes.dart';
import 'bloc/forgot_set_password_bloc.dart';
import 'bloc/forgot_set_password_event.dart';
import 'bloc/forgot_set_passrord_state.dart';

class ForgotSetPasswordScreen extends StatelessWidget {
  const ForgotSetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotSetPasswordBloc>(
      create: (BuildContext context) => ForgotSetPasswordBloc(),
      child: CustomScaffold(
        appBar: const CustomAppBar(),
        body: BlocConsumer<ForgotSetPasswordBloc, ForgotSetPasswordState>(
            listener: (context, state) {
          if (state.status == ForgotSetPasswordStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password set successfully!')),
            );
          } else if (state.status == ForgotSetPasswordStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Something went wrong'),
              ),
            );
          }
        }, builder: (context, state) {
          final forgotsetPasswordBloc = context.read<ForgotSetPasswordBloc>();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Form(
                      key: forgotsetPasswordBloc.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonAuthText(
                            text: 'confirm password',
                            buttontext:
                                'Set the new password for your account so you can login and access all the features.',
                          ),
                          UIHelper.verticalSpace(24.h),
                          _buildTextforomfileName(
                            'Password',
                          ),
                          UIHelper.verticalSpace(5.h),
                          CustomFormField(
                            validator: passwordValidator,
                            textInputAction: TextInputAction.next,
                            controller:
                                forgotsetPasswordBloc.passwordcontolrler,
                            fillColor: AppColors.cFFFFFF,
                            enableBorderColor: AppColors.cE6E6E6,
                            hintText: "Enter your password",
                            isPass: true,
                            isObsecure: !state.passwordVisible,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  forgotsetPasswordBloc.add(
                                    ForgotSetPasswordPasswordVisibilityEvent(
                                      isVisible: !state.passwordVisible,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  state.passwordVisible
                                      ? Assets.icons.eyeOff.path
                                      : Assets.icons.eye.path,
                                  width: 20.w,
                                  color: state.passwordVisible
                                      ? AppColors.c808080
                                      : AppColors.c1A1A1A,
                                ),
                              ),
                            ),
                          ),
                          UIHelper.verticalSpace(24.h),
                          _buildTextforomfileName(
                            'confirm password',
                          ),
                          UIHelper.verticalSpace(5.h),
                          CustomFormField(
                            validator: (value) => confirmPasswordValidator(
                              value,
                              forgotsetPasswordBloc.passwordcontolrler.text,
                            ),
                            textInputAction: TextInputAction.next,
                            controller:
                                forgotsetPasswordBloc.confirmPasswordcontroller,
                            fillColor: AppColors.cFFFFFF,
                            enableBorderColor: AppColors.cE6E6E6,
                            hintText: "Confirm your password",
                            isPass: true,
                            isObsecure: !state.conrimPasswordVisible,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  forgotsetPasswordBloc.add(
                                    ForgotSetPasswordConfirmVisibilityEvent(
                                      isVisible: !state.conrimPasswordVisible,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  state.conrimPasswordVisible
                                      ? Assets.icons.eyeOff.path
                                      : Assets.icons.eye.path,
                                  width: 20.w,
                                  color: state.conrimPasswordVisible
                                      ? AppColors.c808080
                                      : AppColors.c1A1A1A,
                                ),
                              ),
                            ),
                          ),
                          UIHelper.verticalSpace(24.h),
                          AnimatedBuilder(
                            animation: Listenable.merge([
                              forgotsetPasswordBloc.passwordcontolrler,
                              forgotsetPasswordBloc.confirmPasswordcontroller,
                            ]),
                            builder: (context, child) {
                              final passwordText =
                                  forgotsetPasswordBloc.passwordcontolrler.text;
                              final confirmPasswordText = forgotsetPasswordBloc
                                  .confirmPasswordcontroller.text;

                              final isEnabled =
                                  passwordValidator(passwordText) == null &&
                                      confirmPasswordValidator(
                                            confirmPasswordText,
                                            passwordText,
                                          ) ==
                                          null;
                              return CustomButton(
                                isLoading: state.status ==
                                    ForgotSetPasswordStatus.loading,
                                bgColor: isEnabled
                                    ? AppColors.c1A1A1A
                                    : AppColors.cCCCCCC,
                                onTap: () {
                                  CommonSucessfullDilog.show(
                                    context: context,
                                    onTap: () {
                                     NavigationService.navigateToReplacement(Routes.loginScreen);
                                    },
                                    btnName: "Login",
                                  );

                                  // final isValid = forgotsetPasswordBloc
                                  //         .formKey.currentState
                                  //         ?.validate() ??
                                  //     false;
                                  // if (!isValid) return;

                                  // forgotsetPasswordBloc.add(
                                  //   ForgotSetPasswordButtonPressed(
                                  //     password: passwordText,
                                  //     confirmPassword: confirmPasswordText,
                                  //   ),
                                  // );
                                },
                                btnName: "Continue",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
