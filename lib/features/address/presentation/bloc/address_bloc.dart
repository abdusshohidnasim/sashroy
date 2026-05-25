import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/address_model.dart';
import 'address_event.dart';
import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState()) {
    on<LoadAddressesEvent>(_onLoadAddresses);
    on<SelectAddressEvent>(_onSelectAddress);
    on<SetDefaultAddressEvent>(_onSetDefaultAddress);
    on<ApplyAddressEvent>(_onApplyAddress);
    on<AddNewAddressEvent>(_onAddNewAddress);
  }

  void _onLoadAddresses(LoadAddressesEvent event, Emitter<AddressState> emit) {
    emit(state.copyWith(status: AddressStatus.loading));

    final addresses = _getSeededAddresses();
    final defaultAddress =
        addresses.firstWhere((addr) => addr.isDefault, orElse: () => addresses.first);

    emit(state.copyWith(
      status: AddressStatus.loaded,
      addresses: addresses,
      selectedAddressId: defaultAddress.id,
      selectedAddress: defaultAddress,
    ));
  }

  void _onSelectAddress(
    SelectAddressEvent event,
    Emitter<AddressState> emit,
  ) {
    final selectedAddress = state.addresses
        .firstWhere((addr) => addr.id == event.addressId);

    emit(state.copyWith(
      selectedAddressId: event.addressId,
      selectedAddress: selectedAddress,
    ));
  }

  void _onSetDefaultAddress(
    SetDefaultAddressEvent event,
    Emitter<AddressState> emit,
  ) {
    final updatedAddresses = state.addresses.map((addr) {
      return addr.copyWith(isDefault: addr.id == event.addressId);
    }).toList();

    final selectedAddress = updatedAddresses
        .firstWhere((addr) => addr.id == event.addressId);

    emit(state.copyWith(
      addresses: updatedAddresses,
      selectedAddressId: event.addressId,
      selectedAddress: selectedAddress,
    ));
  }

  void _onApplyAddress(
    ApplyAddressEvent event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(
      status: AddressStatus.loading,
      selectedAddress: event.address,
      selectedAddressId: event.address.id,
    ));

    emit(state.copyWith(
      status: AddressStatus.success,
    ));
  }

  void _onAddNewAddress(
    AddNewAddressEvent event,
    Emitter<AddressState> emit,
  ) {
    final newAddress = AddressModel(
      id: state.addresses.length + 1,
      title: event.title,
      address: event.address,
      isDefault: event.isDefault,
    );

    final updatedAddresses = [
      for (final address in state.addresses)
        event.isDefault ? address.copyWith(isDefault: false) : address,
      newAddress,
    ];

    emit(state.copyWith(
      addresses: updatedAddresses,
      selectedAddressId: newAddress.id,
      selectedAddress: newAddress,
    ));
  }

  List<AddressModel> _getSeededAddresses() {
    return const [
      AddressModel(
        id: 1,
        title: 'Home',
        address: '925 S Chugach St #APT 10, Alaska 99645',
        isDefault: true,
      ),
      AddressModel(
        id: 2,
        title: 'Office',
        address: '2438 6th Ave, Ketchikan, Alaska 99901',
        isDefault: false,
      ),
      AddressModel(
        id: 3,
        title: 'Apartment',
        address: '2551 Vista Dr #B301, Juneau, Alaska 99801',
        isDefault: false,
      ),
      AddressModel(
        id: 4,
        title: "Parent's House",
        address: '4821 Ridge Top Cir, Anchorage, Alaska 99507',
        isDefault: false,
      ),
    ];
  }
}
