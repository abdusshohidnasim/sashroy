import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

class PaymentValidationSubmitted extends PaymentEvent {
  const PaymentValidationSubmitted();
}
