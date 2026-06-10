import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../helpers/di.dart';
import '../../../../../helpers/navigation_service.dart';
import '../../../../../helpers/all_routes.dart';
import '../../../../../networks/api_acess.dart';
import '../../../../../common_widgets/custom_toast.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(const LoginState()) {
    on<TogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ));
    });

    on<LoginButtonPressed>((event, emit) async {
      debugPrint('🔵 LoginButtonPressed event received');
      emit(state.copyWith(status: LoginStatus.loading));

      if (formKey.currentState!.validate()) {
        debugPrint('Form is valid, calling API...');
        try {
          bool success = await postLoginRxObj.post(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          debugPrint('📡 API response: success = $success');
          if (success) {
            await appData.write(kKeyIsLoggedIn, true);
            emit(state.copyWith(status: LoginStatus.success));

            // Navigate after successful login
            NavigationService.navigateToReplacement(Routes.buttomNavBar);
          } else {
            emit(state.copyWith(
              status: LoginStatus.failure,
              errorMessage: 'Login failed. Please check your credentials.',
            ));
          }
        } catch (e) {
          debugPrint('❌ Login error: $e');
          customToastMessage("Login failed", e.toString());
          emit(state.copyWith(
            status: LoginStatus.failure,
            errorMessage: e.toString(),
          ));
        }
      } else {
        debugPrint('⚠️ Form validation failed');
        emit(state.copyWith(status: LoginStatus.initial));
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}