import 'package:equatable/equatable.dart';

enum SignUpVerificationStatus { initial, loading, success, failure }

class SignUpVerificationState extends Equatable {
  final SignUpVerificationStatus status;
  final String code;
  final String? errorMessage;
  final int resendSecondsRemaining;

  const SignUpVerificationState({
    this.status = SignUpVerificationStatus.initial,
    this.code = '',
    this.errorMessage,
    this.resendSecondsRemaining = 60,
  });

  SignUpVerificationState copyWith({
    SignUpVerificationStatus? status,
    String? code,
    String? errorMessage,
    int? resendSecondsRemaining,
  }) {
    return SignUpVerificationState(
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