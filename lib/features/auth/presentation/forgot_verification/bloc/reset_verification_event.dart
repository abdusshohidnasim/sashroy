import 'package:equatable/equatable.dart';

abstract class ResetVerificationEvent extends Equatable {
  
  const ResetVerificationEvent();

  @override
  List<Object?> get props => [];
}

class ResetVerificationCodeChanged extends ResetVerificationEvent {
  final String code;

  const ResetVerificationCodeChanged({required this.code});

  @override
  List<Object?> get props => [code];
}

class ResetVerificationSubmitted extends ResetVerificationEvent {
  final String code;
  final String? email;

  const ResetVerificationSubmitted({required this.code, this.email});

  @override
  List<Object?> get props => [code, email];
}

class ResetVerificationResendRequested extends ResetVerificationEvent {
  final String? email;

  const ResetVerificationResendRequested({this.email});

  @override
  List<Object?> get props => [email];
}

class ResetVerificationResendTicked extends ResetVerificationEvent {
  const ResetVerificationResendTicked();
}