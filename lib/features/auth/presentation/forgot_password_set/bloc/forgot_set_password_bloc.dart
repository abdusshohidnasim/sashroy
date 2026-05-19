import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_set_passrord_state.dart';
import 'forgot_set_password_event.dart';

class ForgotSetPasswordBloc
    extends Bloc<ForgotSetPasswordEvent, ForgotSetPasswordState> {
  final passwordcontolrler = TextEditingController();
  final confirmPasswordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgotSetPasswordBloc()
      : super(const ForgotSetPasswordState(
          errorMessage: null,
          isLoadingstate: false,
          passwordVisible: false,
          isSuccess: false,
          conrimPasswordVisible: false,
        )) {
    on<ForgotSetPasswordButtonPressed>((event, emit) async {
      if (event.password != event.confirmPassword) {
        emit(state.copywith(
          status: ForgotSetPasswordStatus.failure,
          isLoadingstate: false,
          isSuccess: false,
          errorMessage: 'Passwords do not match',
        ));
        return;
      }

      emit(state.copywith(
        status: ForgotSetPasswordStatus.loading,
        isLoadingstate: true,
        isSuccess: false,
        errorMessage: null,
      ));

      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copywith(
          status: ForgotSetPasswordStatus.success,
          isLoadingstate: false,
          isSuccess: true,
          errorMessage: null,
        ));
      } catch (e) {
        emit(state.copywith(
          status: ForgotSetPasswordStatus.failure,
          isLoadingstate: false,
          isSuccess: false,
          errorMessage: 'An error occurred.',
        ));
      }
    });

    on<ForgotSetPasswordPasswordVisibilityEvent>((event, emit) {
      emit(state.copywith(passwordVisible: event.isVisible));
    });

    on<ForgotSetPasswordConfirmVisibilityEvent>((event, emit) {
      emit(state.copywith(conrimPasswordVisible: event.isVisible));
    });
  }

  @override
  Future<void> close() {
    passwordcontolrler.dispose();
    confirmPasswordcontroller.dispose();
    return super.close();
  }
}
