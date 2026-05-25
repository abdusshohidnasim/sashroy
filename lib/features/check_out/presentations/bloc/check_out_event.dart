import 'package:equatable/equatable.dart';

abstract class CheckOutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCheckOutEvent extends CheckOutEvent {}

class SelectPaymentMethodEvent extends CheckOutEvent {
  final String paymentMethod;

  SelectPaymentMethodEvent({required this.paymentMethod});

  @override
  List<Object?> get props => [paymentMethod];
}

class ApplyPromoCodeEvent extends CheckOutEvent {
  final String promoCode;

  ApplyPromoCodeEvent({required this.promoCode});

  @override
  List<Object?> get props => [promoCode];
}

class ChangeAddressEvent extends CheckOutEvent {
  final String address;
  final String title;

  ChangeAddressEvent({required this.address, required this.title});

  @override
  List<Object?> get props => [address, title];
}

class PlaceOrderEvent extends CheckOutEvent {}
