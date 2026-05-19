import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  const SignupState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
    required this.errorMessage,
    required this.isPasswordVisible,
  });
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;
  final bool isPasswordVisible;

  SignupState copywith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return SignupState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isFailure,
        errorMessage,
        isPasswordVisible,
      ];
}
