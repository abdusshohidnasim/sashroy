import 'package:equatable/equatable.dart';
enum SignUpEmailStatus { initial, loading, success, failure }

class SignUpEmailState  extends Equatable{
final String? errorMessage;
final SignUpEmailStatus status;
final bool isLoadingstate; 
  const SignUpEmailState({
    this.errorMessage,
    this.isLoadingstate = false,
    this.status = SignUpEmailStatus.initial,
  });

  SignUpEmailState copywith({
    String? errorMessage,
    bool? isLoadingstate,
    SignUpEmailStatus? status,
  }) {
    return SignUpEmailState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingstate: isLoadingstate ?? this.isLoadingstate,
      status: status ?? this.status,
    );
  }
  @override

  List<Object?> get props => [errorMessage, isLoadingstate, status];
}