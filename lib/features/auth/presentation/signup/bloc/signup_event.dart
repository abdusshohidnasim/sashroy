import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupButtompressedEvent extends SignupEvent {
  final String email;
  final String password;

  SignupButtompressedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignupPasswordVisibilityEvent extends SignupEvent {
  final bool isVisible;

  SignupPasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}