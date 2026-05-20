import 'package:equatable/equatable.dart';

abstract class SignUpEmailEvent extends Equatable {

  @override
  List<Object?> get props => [];
}
class SignUpEmailButtonPressed extends SignUpEmailEvent {
  final String email;

  SignUpEmailButtonPressed({required this.email});

  @override
  List<Object?> get props => [email];
}
