import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      emit(state.copyWith(status: LoginStatus.loading));
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (event.email == 'user@example.com' && event.password == 'password') {
          emit(state.copyWith(status: LoginStatus.success));
        } else {
          emit(state.copyWith(
            status: LoginStatus.failure,
            errorMessage: 'Invalid email or password',
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'An error occurred.',
        ));
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