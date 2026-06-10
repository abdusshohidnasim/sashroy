import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/auth/presentation/signup/bloc/signup_event.dart';
import 'package:sashroy/features/auth/presentation/signup/bloc/signup_state.dart';
import 'package:sashroy/networks/api_acess.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
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
        final bool sucess = await postSignupRxObj.postsignup(
            email: event.email,
            password: event.password,
            name: event.name,
            number: event.phone);
        if (sucess) {
          emit(state.copywith(
            isLoading: false,
            isSuccess: true,
            isFailure: false,
            errorMessage: '',
          ));
        } else {
          emit(state.copywith(
            isLoading: false,
            isSuccess: false,
            isFailure: true,
            errorMessage: 'Signup failed. Please try again.',
          ));
          emailController.clear();
          passwordController.clear();
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
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
