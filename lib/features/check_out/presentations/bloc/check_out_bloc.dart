import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_out_event.dart';
import 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  CheckOutBloc() : super(const CheckOutState()) {
    on<LoadCheckOutEvent>(_onLoadCheckOut);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
    on<ApplyPromoCodeEvent>(_onApplyPromoCode);
    on<ChangeAddressEvent>(_onChangeAddress);
    on<PlaceOrderEvent>(_onPlaceOrder);
  }

  void _onLoadCheckOut(LoadCheckOutEvent event, Emitter<CheckOutState> emit) {
    emit(state.copyWith(status: CheckOutStatus.loading));
    emit(state.copyWith(status: CheckOutStatus.loaded));
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethodEvent event,
    Emitter<CheckOutState> emit,
  ) {
    emit(state.copyWith(selectedPaymentMethod: event.paymentMethod));
  }

  void _onApplyPromoCode(
    ApplyPromoCodeEvent event,
    Emitter<CheckOutState> emit,
  ) {
    final promoCode = event.promoCode.toUpperCase();

    double discount = 0.0;
    if (promoCode == 'WELCOME10') {
      discount = 50.0;
    } else if (promoCode == 'SAVE20') {
      discount = 100.0;
    } else if (promoCode == 'MEGA50') {
      discount = 250.0;
    } else {
      emit(state.copyWith(
        errorMessage: 'Invalid promo code',
      ));
      return;
    }

    emit(state.copyWith(
      promoCode: promoCode,
      discountAmount: discount,
      errorMessage: null,
    ));
  }

  void _onChangeAddress(
    ChangeAddressEvent event,
    Emitter<CheckOutState> emit,
  ) {
    emit(state.copyWith(
      addressTitle: event.title,
      addressFull: event.address,
    ));
  }

  void _onPlaceOrder(
    PlaceOrderEvent event,
    Emitter<CheckOutState> emit,
  ) {
    emit(state.copyWith(status: CheckOutStatus.loading));
    emit(state.copyWith(status: CheckOutStatus.success));
  }
}
