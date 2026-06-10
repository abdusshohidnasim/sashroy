import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupButtompressedEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
 

  SignupButtompressedEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [email, password, name, phone];
}

class SignupPasswordVisibilityEvent extends SignupEvent {
  final bool isVisible;

  SignupPasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}