import 'package:equatable/equatable.dart';

enum ResetVerificationStatus { initial, loading, success, failure }

class ResetVerificationState extends Equatable {
  final ResetVerificationStatus status;
  final String code;
  final String? errorMessage;
  final int resendSecondsRemaining;

  const ResetVerificationState({
    this.status = ResetVerificationStatus.initial,
    this.code = '',
    this.errorMessage,
    this.resendSecondsRemaining = 60,
  });

  ResetVerificationState copyWith({
    ResetVerificationStatus? status,
    String? code,
    String? errorMessage,
    int? resendSecondsRemaining,
  }) {
    return ResetVerificationState(
      status: status ?? this.status,
      code: code ?? this.code,
      errorMessage: errorMessage ?? this.errorMessage,
      resendSecondsRemaining:
          resendSecondsRemaining ?? this.resendSecondsRemaining,
    );
  }

  @override
  List<Object?> get props => [status, code, errorMessage, resendSecondsRemaining];
}