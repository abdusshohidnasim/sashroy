import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   bool _isPasswordVisible = false;
   bool _isPasswordIconVisible = false;
  LoginBloc() : super(LoginInitial()) {


on<ShowPasswordIconEvent>((event, emit) {
  _isPasswordIconVisible =! _isPasswordIconVisible;
emit(ShowPasswordiconState(isVisible: _isPasswordVisible));
}); 
    on<TogglePasswordVisibility>((event, emit) {
_isPasswordVisible = !_isPasswordVisible;
     emit(PasswordVisibilityState(isVisible: _isPasswordVisible));
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (event.email == 'user@example.com' && event.password == 'password') {
          emit(LoginSuccess());
        } else if (event.email.isEmpty || event.password.isEmpty) {
          emit(LoginFailure(errormessage: 'Email and password are required'));
        } else {
          emit(LoginFailure(errormessage: 'Invalid email or password'));
        }
      } catch (e) {
        emit(
            LoginFailure(errormessage: 'An error occurred. Please try again.'));
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
