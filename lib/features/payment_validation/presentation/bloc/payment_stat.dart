import 'package:equatable/equatable.dart';

enum PaymentValidationStatus { initial, submitting, success, failure }

class PaymentState extends Equatable {
  final PaymentValidationStatus status;
  final String? errorMessage;

  const PaymentState({
    this.status = PaymentValidationStatus.initial,
    this.errorMessage,
  });

  PaymentState copyWith({
    PaymentValidationStatus? status,
    String? errorMessage,
  }) {
    return PaymentState(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
