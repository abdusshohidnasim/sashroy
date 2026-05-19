import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}
class ForgotPasswordEmailButtonPressed extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordEmailButtonPressed({required this.email});

  @override
  List<Object?> get props => [email];
}
