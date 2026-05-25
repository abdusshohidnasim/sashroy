import 'package:equatable/equatable.dart';
import '../../model/address_model.dart';

enum AddressStatus { initial, loading, loaded, error, success }

class AddressState extends Equatable {
  final AddressStatus status;
  final List<AddressModel> addresses;
  final int? selectedAddressId;
  final AddressModel? selectedAddress;
  final String? errorMessage;

  const AddressState({
    this.status = AddressStatus.initial,
    this.addresses = const [],
    this.selectedAddressId,
    this.selectedAddress,
    this.errorMessage,
  });

  AddressState copyWith({
    AddressStatus? status,
    List<AddressModel>? addresses,
    int? selectedAddressId,
    AddressModel? selectedAddress,
    String? errorMessage,
  }) {
    return AddressState(
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        addresses,
        selectedAddressId,
        selectedAddress,
        errorMessage,
      ];
}
