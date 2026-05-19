import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/features/auth/presentation/login/bloc/login_state.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import '../../../../common_widgets/common_auth_text.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: CustomScaffold(
        body: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
          if (state.status == LoginStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
          } else if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed. Please try again.')),
            );
          }
        }, builder: (context, state) {
          final loginreadbloc = context.read<LoginBloc>();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Form(
                      key: loginreadbloc.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const CommonAuthText(
                          text: 'Login to your account',
                          buttontext: 'It’s great to see you again.',
                        ),
                        UIHelper.verticalSpace(24.h),
                        _buildTextforomfileName(
                          'Email',
                        ),
                        UIHelper.verticalSpace(5.h),
                        CustomFormField(
                          validator: emailValidator,
                          textInputAction: TextInputAction.next,
                          controller: loginreadbloc.emailController,
                          fillColor: AppColors.cFFFFFF,
                          enableBorderColor: AppColors.cE6E6E6,
                          hintText: "Enter your email address",
                        ),
                        UIHelper.verticalSpace(16.h),
                        _buildTextforomfileName(
                          'Password',
                        ),
                        UIHelper.verticalSpace(5.h),
                        CustomFormField(
                          validator: passwordValidator,
                          controller: loginreadbloc.passwordController,
                          fillColor: AppColors.cFFFFFF,
                          enableBorderColor: AppColors.cE6E6E6,
                          hintText: "Enter your password",
                          isPass: true,
                          isObsecure: !state.isPasswordVisible,
                          suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  loginreadbloc
                                      .add(TogglePasswordVisibilityEvent());
                                },
                                child: Image.asset(
                                  state.isPasswordVisible
                                      ? Assets.icons.eyeOff.path
                                      : Assets.icons.eye.path,
                                  width: 20.w,
                                  color: state.isPasswordVisible
                                      ? AppColors.c808080
                                      : AppColors.c1A1A1A,
                                ),
                              )),
                        ),
                        UIHelper.verticalSpace(10.h),
                        RichText(
                            text: TextSpan(
                          text: 'Forgot your password? ',
                          style: TextFontStyle.textStyle14C808080GSR400,
                          children: [
                            TextSpan(
                              text: 'Reset your password',
                              style: TextFontStyle.textStyle14C1A1A1ADGSM500
                                  .copyWith(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  NavigationService.navigateTo(
                                      Routes.forgotPasswordEmailScreen);
                                },
                            ),
                          ],
                        )),
                        UIHelper.verticalSpace(24.h),
                        AnimatedBuilder(
                          animation: Listenable.merge([
                            loginreadbloc.emailController,
                            loginreadbloc.passwordController,
                          ]),
                          builder: (context, child) {
                            final emailText =
                                loginreadbloc.emailController.text;
                            final passwordText =
                                loginreadbloc.passwordController.text;

                            final isEnabled =
                                emailValidator(emailText) == null &&
                                    passwordValidator(passwordText) == null;

                            return CustomButton(
                              isLoading: state.status == LoginStatus.loading,
                              bgColor: isEnabled
                                  ? AppColors.c1A1A1A
                                  : AppColors.cCCCCCC,
                              onTap: () {
                                final isValid = loginreadbloc
                                        .formKey.currentState
                                        ?.validate() ??
                                    false;
                                if (!isValid) return;

                                loginreadbloc.add(
                                  LoginButtonPressed(
                                    email: emailText,
                                    password: passwordText,
                                  ),
                                );
                              },
                              btnName: "Login",
                            );
                          },
                        ),
                        UIHelper.verticalSpace(24.h),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.cE6E6E6,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                'or',
                                style: TextFontStyle.textStyle14C808080GSR400,
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors.cE6E6E6,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(24.h),
                        CustomButton(
                          showBorder: true,
                          borderColor: AppColors.cCCCCCC,
                          prefixIcon: Image.asset(
                            Assets.icons.google.path,
                            width: 20.w,
                          ),
                          bgColor: AppColors.cFFFFFF,
                          onTap: () {
                            NavigationService.navigateTo(Routes.signUpScreen);
                          },
                          btnName: "Login with Google",
                          textStyle: TextFontStyle.textStyle16C1A1A1ADGSM500
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ),
              RichText(
                  text: TextSpan(
                text: 'Don’t have an account? ',
                style: TextFontStyle.textStyle14C808080GSR400,
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextFontStyle.textStyle14C1A1A1ADGSM500.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        NavigationService.navigateTo(Routes.signUpScreen);
                      },
                  ),
                ],
              )),
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
