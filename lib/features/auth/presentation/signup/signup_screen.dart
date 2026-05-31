import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_button.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/gen/colors.gen.dart';
import 'package:sashroy/helpers/all_routes.dart';
import 'package:sashroy/helpers/navigation_service.dart';
import 'package:sashroy/helpers/ui_helpers.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (BuildContext context) => SignupBloc(),
      child: CustomScaffold(
        body: BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup successful!')),
            );
          } else if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signup failed. Please try again.')),
            );
          }
        }, builder: (context, state) {
          final signupReadBloc = context.read<SignupBloc>();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Form(
                      key: signupReadBloc.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Text(
                            "Create an account",
                            style: TextFontStyle.textStyle28C1A1A1ADGSS600,
                          ),
                          UIHelper.verticalSpace(5.h),
                          Text(
                            "Let’s create your account.",
                            style: TextFontStyle.textStyle16C808080GSR400,
                          ),
                          UIHelper.verticalSpace(24.h),
                          _buildTextforomfileName(
                            'Full Name',
                          ),
                          UIHelper.verticalSpace(5.h),
                          CustomFormField(
                            validator: nameValidator,
                            textInputAction: TextInputAction.next,
                            controller: signupReadBloc.nameController,
                            fillColor: AppColors.cFFFFFF,
                            enableBorderColor: AppColors.cE6E6E6,
                            hintText: "Enter your full name",
                          ),
                          UIHelper.verticalSpace(24.h),
                          _buildTextforomfileName(
                            'Email',
                          ),
                          UIHelper.verticalSpace(5.h),
                          CustomFormField(
                            validator: emailValidator,
                            textInputAction: TextInputAction.next,
                            controller: signupReadBloc.emailController,
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
                            controller: signupReadBloc.passwordController,
                            fillColor: AppColors.cFFFFFF,
                            enableBorderColor: AppColors.cE6E6E6,
                            hintText: "Enter your password",
                            isPass: true,
                            isObsecure: !state.isPasswordVisible,
                            suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: GestureDetector(
                                  onTap: () {
                                    signupReadBloc.add(
                                      SignupPasswordVisibilityEvent(
                                        isVisible: !state.isPasswordVisible,
                                      ),
                                    );
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
                            text:
                                'By signing up you agree to our  and Cookie Use ',
                            style: TextFontStyle.textStyle14C808080GSR400,
                            children: [
                              TextSpan(
                                text: 'Terms',
                                style: TextFontStyle.textStyle14C1A1A1ADGSM500
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle reset password tap
                                  },
                              ),
                              TextSpan(
                                text: ', ',
                                style: TextFontStyle.textStyle14C808080GSR400,
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextFontStyle.textStyle14C1A1A1ADGSM500
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle reset password tap
                                  },
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextFontStyle.textStyle14C808080GSR400,
                              ),
                              TextSpan(
                                text: 'Cookie Use',
                                style: TextFontStyle.textStyle14C1A1A1ADGSM500
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle reset password tap
                                  },
                              ),
                            ],
                          )),
                          UIHelper.verticalSpace(24.h),
                          AnimatedBuilder(
                            animation: Listenable.merge([
                              signupReadBloc.nameController,
                              signupReadBloc.emailController,
                              signupReadBloc.passwordController,
                            ]),
                            builder: (context, child) {
                              final nameText =
                                  signupReadBloc.nameController.text;
                              final emailText =
                                  signupReadBloc.emailController.text;
                              final passwordText =
                                  signupReadBloc.passwordController.text;

                              final isEnabled =
                                  nameValidator(nameText) == null &&
                                      emailValidator(emailText) == null &&
                                      passwordValidator(passwordText) == null;

                              return CustomButton(
                                isLoading: state.isLoading,
                                bgColor: isEnabled
                                    ? AppColors.c1A1A1A
                                    : AppColors.cCCCCCC,
                                onTap: () {
                                  NavigationService.navigateTo(Routes.signUpEmailScreen);
                                  // final isValid = signupReadBloc
                                  //         .formKey.currentState
                                  //         ?.validate() ??
                                  //     false;
                                  // if (!isValid) return;

                                  // signupReadBloc.add(
                                  //   SignupButtompressedEvent(
                                  //     email: emailText,
                                  //     password: passwordText,
                                  //   ),
                                  // );
                                },
                                btnName: "Sign up",
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

                            },
                            btnName: "Sign up with Google",
                            textStyle: TextFontStyle.textStyle16C1A1A1ADGSM500
                                .copyWith(fontWeight: FontWeight.w700),
                          ),

UIHelper.verticalSpace(40.h),
                           Center(
                             child: RichText(
                                               text: TextSpan(
                                             text: 'Already have an account? ',
                                             style: TextFontStyle.textStyle14C808080GSR400,
                                             children: [
                                               TextSpan(
                                                 text: 'Login',
                                                 style: TextFontStyle.textStyle14C1A1A1ADGSM500.copyWith(
                                                   decoration: TextDecoration.underline,
                                                   fontWeight: FontWeight.w600,
                                                 ),
                                                 recognizer: TapGestureRecognizer()
                                                   ..onTap = () {
                                                     NavigationService.navigateToReplacement(
                                                       Routes.loginScreen,
                                                     );
                                                   },
                                               ),
                                             ],
                                           )),
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
