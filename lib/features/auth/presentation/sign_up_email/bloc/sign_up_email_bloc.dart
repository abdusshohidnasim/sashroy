import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_email_event.dart';
import 'sign_up_email_state.dart';

class SignUpEmailBloc
    extends Bloc<SignUpEmailEvent, SignUpEmailState> {
      final emailController = TextEditingController();
      final formKey = GlobalKey<FormState>();
  SignUpEmailBloc() : super(const SignUpEmailState()) {
    on<SignUpEmailButtonPressed>((event, emit) async{
      emit(state.copywith(
          isLoadingstate: true, status: SignUpEmailStatus.loading));
          try {
            await Future.delayed(const Duration(seconds: 2));
            if (event.email == 'user@example.com') {
              emit(state.copywith(
                  isLoadingstate: false, status: SignUpEmailStatus.success));
            } else {
              emit(state.copywith(
                  isLoadingstate: false,
                  status: SignUpEmailStatus.failure,
                  errorMessage: 'Invalid email address'));
            }
            
          } catch (e) {
            emit(state.copywith(
                isLoadingstate: false, status: SignUpEmailStatus.failure));
          }
    });
  }
}
