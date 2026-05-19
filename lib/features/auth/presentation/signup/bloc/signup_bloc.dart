import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/auth/presentation/signup/bloc/signup_event.dart';
import 'package:sashroy/features/auth/presentation/signup/bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  SignupBloc()
      : super(const SignupState(
          isLoading: false,
          isSuccess: false,
          isFailure: false,
          errorMessage: '',
          isPasswordVisible: false,
        )) {
    on<SignupButtompressedEvent>((event, emit) async {
      emit(state.copywith(
        isLoading: true,
        isSuccess: false,
        isFailure: false,
        errorMessage: '',
      ));
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (event.email == 'user@example.com' && event.password == 'password') {
          emit(state.copywith(
            isLoading: false,
            isSuccess: true,
            isFailure: false,
            errorMessage: '',
          ));
        } else {
          emit(state.copywith(
            isLoading: false,
            isFailure: true,
            isSuccess: false,
            errorMessage: 'Invalid email or password',
          ));
        }
      } catch (e) {
        emit(state.copywith(
          isLoading: false,
          isFailure: true,
          isSuccess: false,
          errorMessage: 'An error occurred.',
        ));
      }
    });
    on<SignupPasswordVisibilityEvent>((event, emit) {
      emit(state.copywith(isPasswordVisible: event.isVisible));
    });
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}