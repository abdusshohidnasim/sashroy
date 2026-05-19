import 'package:equatable/equatable.dart';
enum ForgotPasswordEmailStatus { initial, loading, success, failure }

class ForgotPasswordEmailState  extends Equatable{
final String? errorMessage;
final ForgotPasswordEmailStatus status;
final bool isLoadingstate; 
  const ForgotPasswordEmailState({
    this.errorMessage,
    this.isLoadingstate = false,
    this.status = ForgotPasswordEmailStatus.initial,
  });

  ForgotPasswordEmailState copywith({
    String? errorMessage,
    bool? isLoadingstate,
    ForgotPasswordEmailStatus? status,
  }) {
    return ForgotPasswordEmailState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingstate: isLoadingstate ?? this.isLoadingstate,
      status: status ?? this.status,
    );
  }
  @override

  List<Object?> get props => [errorMessage, isLoadingstate, status];
}