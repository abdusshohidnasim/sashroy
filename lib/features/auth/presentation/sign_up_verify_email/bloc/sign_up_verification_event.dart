import 'package:equatable/equatable.dart';

abstract class SignUpVerificationEvent extends Equatable {
  
  const SignUpVerificationEvent();

  @override
  List<Object?> get props => [];
}

class SignUpVerificationCodeChanged extends SignUpVerificationEvent {
  final String code;

  const SignUpVerificationCodeChanged({required this.code});

  @override
  List<Object?> get props => [code];
}

class SignUpVerificationSubmitted extends SignUpVerificationEvent {
  final String code;
  final String? email;

  const SignUpVerificationSubmitted({required this.code, this.email});

  @override
  List<Object?> get props => [code, email];
}

class SignUpVerificationResendRequested extends SignUpVerificationEvent {
  final String? email;

  const SignUpVerificationResendRequested({this.email});

  @override
  List<Object?> get props => [email];
}

class SignUpVerificationResendTicked extends SignUpVerificationEvent {
  const SignUpVerificationResendTicked();
}