import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sashroy/common_widgets/custom_scaffold.dart';
import 'package:sashroy/common_widgets/custom_textform_field.dart';
import 'package:sashroy/constants/text_font_style.dart';
import 'package:sashroy/constants/validator.dart';
import 'package:sashroy/features/auth/presentation/login/bloc/login_state.dart';
import 'package:sashroy/gen/assets.gen.dart';
import 'package:sashroy/gen/colors.gen.dart';
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
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed. Please try again.')),
            );
          }
        }, builder: (context, state) {
          final loginreadbloc = context.read<LoginBloc>();
          bool obscureText = true;
          if(state is PasswordVisibilityState){
            obscureText = ! state.isVisible;
          }
          bool ispasswordIconVisible = false;
          if(state is ShowPasswordiconState){
            ispasswordIconVisible = ! state.isVisible;
          }
          return SingleChildScrollView(
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
                 
                      controller: loginreadbloc.passwordController,
                      fillColor: AppColors.cFFFFFF,
                      enableBorderColor: AppColors.cE6E6E6,
                      hintText: "Enter your password",
                      isPass: true,
                      isObsecure: obscureText,
                      suffixIcon:  Padding(
                        padding:  EdgeInsets.only(right: 20.w),
                        child: ispasswordIconVisible ? GestureDetector(
                          onTap: () {
                            loginreadbloc.add(TogglePasswordVisibility());
                          },
                          child: Image.asset(
                            obscureText
                                ? Assets.icons.eyeOff.path
                                : Assets.icons.eye.path,
                              width: 20.w,
                            color: AppColors.c808080,
                          ),
                        ): const SizedBox()
                      ),
                    )
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
