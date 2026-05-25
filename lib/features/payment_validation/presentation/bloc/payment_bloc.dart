import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_event.dart';
import 'payment_stat.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController txIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  PaymentBloc() : super(const PaymentState()) {
    on<PaymentValidationSubmitted>((event, emit) {
      final currentState = formKey.currentState;
      if (currentState == null || !currentState.validate()) {
        emit(state.copyWith(
          status: PaymentValidationStatus.failure,
          errorMessage: 'Please correct the errors',
        ));
        return;
      }

      emit(state.copyWith(status: PaymentValidationStatus.submitting));
      emit(state.copyWith(status: PaymentValidationStatus.success));
    });
  }

  @override
  Future<void> close() {
    txIdController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
