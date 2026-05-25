import 'package:equatable/equatable.dart';

enum CheckOutStatus { initial, loading, loaded, error, success }

class CheckOutState extends Equatable {
  final CheckOutStatus status;
  final String selectedPaymentMethod;
  final String addressTitle;
  final String addressFull;
  final String? promoCode;
  final double discountAmount;
  final String? errorMessage;

  const CheckOutState({
    this.status = CheckOutStatus.initial,
    this.selectedPaymentMethod = 'onlinePayment',
    this.addressTitle = 'Home',
    this.addressFull = '925 S Chugach St #APT 10, Alaska 99645',
    this.promoCode,
    this.discountAmount = 0.0,
    this.errorMessage,
  });

  CheckOutState copyWith({
    CheckOutStatus? status,
    String? selectedPaymentMethod,
    String? addressTitle,
    String? addressFull,
    String? promoCode,
    double? discountAmount,
    String? errorMessage,
  }) {
    return CheckOutState(
      status: status ?? this.status,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      addressTitle: addressTitle ?? this.addressTitle,
      addressFull: addressFull ?? this.addressFull,
      promoCode: promoCode ?? this.promoCode,
      discountAmount: discountAmount ?? this.discountAmount,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedPaymentMethod,
        addressTitle,
        addressFull,
        promoCode,
        discountAmount,
        errorMessage,
      ];
}
