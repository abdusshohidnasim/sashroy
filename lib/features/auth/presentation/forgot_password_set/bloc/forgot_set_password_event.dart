import 'package:equatable/equatable.dart';

abstract class ForgotSetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotSetPasswordButtonPressed extends ForgotSetPasswordEvent {
  final String password;
  final String confirmPassword;

  ForgotSetPasswordButtonPressed({
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [password, confirmPassword];
}

class ForgotSetPasswordPasswordVisibilityEvent extends ForgotSetPasswordEvent {
  final bool isVisible;

  ForgotSetPasswordPasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class ForgotSetPasswordConfirmVisibilityEvent extends ForgotSetPasswordEvent {
  final bool isVisible;

  ForgotSetPasswordConfirmVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}
