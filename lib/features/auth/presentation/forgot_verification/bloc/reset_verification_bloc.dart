import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/reset_verification_repository.dart';
import 'reset_verification_event.dart';
import 'reset_verification_state.dart';

class ResetVerificationBloc
    extends Bloc<ResetVerificationEvent, ResetVerificationState> {
  ResetVerificationBloc({ResetVerificationRepository? repository})
      : _repository = repository ?? const StubResetVerificationRepository(),
        super(const ResetVerificationState()) {
    on<ResetVerificationCodeChanged>(_onCodeChanged);
    on<ResetVerificationSubmitted>(_onSubmitted);
    on<ResetVerificationResendRequested>(_onResendRequested);
    on<ResetVerificationResendTicked>(_onResendTicked);

    _startResendCountdown();
  }

  final ResetVerificationRepository _repository;

  Timer? _resendTimer;

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void _onCodeChanged(
    ResetVerificationCodeChanged event,
    Emitter<ResetVerificationState> emit,
  ) {
    emit(
      state.copyWith(
        code: event.code,
        errorMessage: null,
        status: ResetVerificationStatus.initial,
      ),
    );
  }

  Future<void> _onSubmitted(
    ResetVerificationSubmitted event,
    Emitter<ResetVerificationState> emit,
  ) async {
    emit(state.copyWith(status: ResetVerificationStatus.loading));

    try {
      await _repository.verifyResetCode(code: event.code, email: event.email);
      emit(state.copyWith(status: ResetVerificationStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: ResetVerificationStatus.failure,
          errorMessage: 'Verification failed. Please try again.',
        ),
      );
    }
  }

  Future<void> _onResendRequested(
    ResetVerificationResendRequested event,
    Emitter<ResetVerificationState> emit,
  ) async {
    if (state.resendSecondsRemaining > 0) return;

    emit(state.copyWith(resendSecondsRemaining: 60, errorMessage: null));
    _startResendCountdown();

    try {
      await _repository.resendResetCode(email: event.email);
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
    ResetVerificationResendTicked event,
    Emitter<ResetVerificationState> emit,
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
      add(const ResetVerificationResendTicked());
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
