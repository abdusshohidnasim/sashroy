import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../address/presentation/bloc/address_bloc.dart';
import '../../../address/presentation/bloc/address_event.dart';
import 'add_address_event.dart';
import 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final AddressBloc addressBloc;
  final TextEditingController fullAddressController = TextEditingController();

  AddAddressBloc({required this.addressBloc})
      : super(const AddAddressState()) {
    on<AddAddressNicknameChanged>((event, emit) {
      emit(state.copyWith(
        selectedNickname: event.nickname,
        status: AddAddressStatus.initial,
        errorMessage: null,
      ));
    });

    on<AddAddressToggleDefault>((event, emit) {
      emit(state.copyWith(
        makeDefault: !state.makeDefault,
        status: AddAddressStatus.initial,
        errorMessage: null,
      ));
    });

    on<AddAddressSubmit>((event, emit) {
      final addressText = fullAddressController.text.trim();
      if (addressText.isEmpty) {
        emit(state.copyWith(
          status: AddAddressStatus.failure,
          errorMessage: 'Please enter a full address',
        ));
        return;
      }

      emit(state.copyWith(status: AddAddressStatus.submitting));

      addressBloc.add(
        AddNewAddressEvent(
          title: state.selectedNickname,
          address: addressText,
          isDefault: state.makeDefault,
        ),
      );

      emit(state.copyWith(status: AddAddressStatus.success));
    });
  }

  @override
  Future<void> close() {
    fullAddressController.dispose();
    return super.close();
  }
}
