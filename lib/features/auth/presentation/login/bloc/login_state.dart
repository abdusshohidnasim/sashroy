import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errormessage;
  LoginFailure({required this.errormessage});
  @override
  List<Object?> get props => [errormessage];
}

class PasswordVisibilityState extends LoginState {
  final bool isVisible;
  PasswordVisibilityState({required this.isVisible});
  @override
  List<Object?> get props => [isVisible];
}
class ShowPasswordiconState extends LoginState {
  final bool isVisible;
  ShowPasswordiconState({required this.isVisible});
  @override
  List<Object?> get props => [isVisible];
}