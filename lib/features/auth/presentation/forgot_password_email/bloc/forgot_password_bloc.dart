import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/auth/presentation/forgot_password_email/bloc/forgot_password_email_state.dart';
import 'package:sashroy/features/auth/presentation/forgot_password_email/bloc/forgot_password_event.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordEmailState> {
      final emailController = TextEditingController();
      final formKey = GlobalKey<FormState>();
  ForgotPasswordBloc() : super(const ForgotPasswordEmailState()) {
    on<ForgotPasswordEmailButtonPressed>((event, emit) async{
      emit(state.copywith(
          isLoadingstate: true, status: ForgotPasswordEmailStatus.loading));
          try {
            await Future.delayed(const Duration(seconds: 2));
            if (event.email == 'user@example.com') {
              emit(state.copywith(
                  isLoadingstate: false, status: ForgotPasswordEmailStatus.success));
            } else {
              emit(state.copywith(
                  isLoadingstate: false,
                  status: ForgotPasswordEmailStatus.failure,
                  errorMessage: 'Invalid email address'));
            }
            
          } catch (e) {
            emit(state.copywith(
                isLoadingstate: false, status: ForgotPasswordEmailStatus.failure));
          }
    });
  }
}
