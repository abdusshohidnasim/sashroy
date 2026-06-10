import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/networks/api_acess.dart';
import 'sign_up_verification_event.dart';
import 'sign_up_verification_state.dart';

class SignUpVerificationBloc
    extends Bloc<SignUpVerificationEvent, SignUpVerificationState> {
  
  SignUpVerificationBloc() : super(const SignUpVerificationState()) {
    on<SignUpVerificationCodeChanged>(_onCodeChanged);
    on<SignUpVerificationSubmitted>(_onSubmitted);
    on<SignUpVerificationResendRequested>(_onResendRequested);
    on<SignUpVerificationResendTicked>(_onResendTicked);

    _startResendCountdown();
  }

  Timer? _resendTimer;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void _onCodeChanged(
    SignUpVerificationCodeChanged event,
    Emitter<SignUpVerificationState> emit,
  ) {
    emit(
      state.copyWith(
        code: event.code,
        errorMessage: null,
        status: SignUpVerificationStatus.initial,
      ),
    );
  }

  Future<void> _onSubmitted(
    SignUpVerificationSubmitted event,
    Emitter<SignUpVerificationState> emit,
  ) async {
    emit(state.copyWith(status: SignUpVerificationStatus.loading));

    try {
      bool isSuccess = await postSignUpVerifyRxObj.post(
        email: event.email,
        verificationCode: event.code,
      );

      if (isSuccess) {
        emit(state.copyWith(status: SignUpVerificationStatus.success));
      } else {
        emit(
          state.copyWith(
            status: SignUpVerificationStatus.failure,
            errorMessage: 'Verification failed. Please check your code.',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpVerificationStatus.failure,
          errorMessage: 'An error occurred. Please try again.',
        ),
      );
    }
  }

  Future<void> _onResendRequested(
    SignUpVerificationResendRequested event,
    Emitter<SignUpVerificationState> emit,
  ) async {
    if (state.resendSecondsRemaining > 0) return;

    emit(state.copyWith(resendSecondsRemaining: 60, errorMessage: null));
    _startResendCountdown();

    try {
      bool isSuccess = await postResentRxObj.post(
        email: event.email,
      );

      if (!isSuccess) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to resend code. Please try again.',
            resendSecondsRemaining: 0,
          ),
        );
        _cancelResendTimer();
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to resend code. Please try again.',
          resendSecondsRemaining: 0,
        ),
      );
      _cancelResendTimer();
    }
  }

  void _onResendTicked(
    SignUpVerificationResendTicked event,
    Emitter<SignUpVerificationState> emit,
  ) {
    if (state.resendSecondsRemaining <= 0) {
      _cancelResendTimer();
      return;
    }

    final next = state.resendSecondsRemaining - 1;
    emit(state.copyWith(resendSecondsRemaining: next));

    if (next <= 0) {
      _cancelResendTimer();
    }
  }

  void _startResendCountdown() {
    _cancelResendTimer();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const SignUpVerificationResendTicked());
    });
  }

  void _cancelResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = null;
  }

  @override
  Future<void> close() {
    _cancelResendTimer();
    pinController.dispose();
    focusNode.dispose();
    return super.close();
  }
}