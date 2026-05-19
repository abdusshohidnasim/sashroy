import 'package:equatable/equatable.dart';

enum ForgotSetPasswordStatus { initial, loading, success, failure }

class ForgotSetPasswordState extends Equatable {
  final ForgotSetPasswordStatus status;
  final String? errorMessage;
  final bool isLoadingstate;
  final bool passwordVisible;
  final bool isSuccess;
  final bool conrimPasswordVisible;

  const ForgotSetPasswordState({
    required this.errorMessage,
    required this.isLoadingstate,
    required this.passwordVisible,
    this.status = ForgotSetPasswordStatus.initial,
    required this.isSuccess,
    required this.conrimPasswordVisible,
  });

  ForgotSetPasswordState copywith({
    String? errorMessage,
    bool? isLoadingstate,
    bool? passwordVisible,
    ForgotSetPasswordStatus? status,
    bool? isSuccess,
    bool? conrimPasswordVisible,
  }) {
    return ForgotSetPasswordState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingstate: isLoadingstate ?? this.isLoadingstate,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      status: status ?? this.status,
      isSuccess: isSuccess ?? this.isSuccess,
      conrimPasswordVisible:
          conrimPasswordVisible ?? this.conrimPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        isLoadingstate,
        passwordVisible,
        status,
        isSuccess,
        conrimPasswordVisible
      ];
}
