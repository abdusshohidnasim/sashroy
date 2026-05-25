import 'package:equatable/equatable.dart';
import '../../model/address_model.dart';

abstract class AddressEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAddressesEvent extends AddressEvent {}

class SelectAddressEvent extends AddressEvent {
  final int addressId;

  SelectAddressEvent({required this.addressId});

  @override
  List<Object?> get props => [addressId];
}

class SetDefaultAddressEvent extends AddressEvent {
  final int addressId;

  SetDefaultAddressEvent({required this.addressId});

  @override
  List<Object?> get props => [addressId];
}

class ApplyAddressEvent extends AddressEvent {
  final AddressModel address;

  ApplyAddressEvent({required this.address});

  @override
  List<Object?> get props => [address];
}

class AddNewAddressEvent extends AddressEvent {
  final String title;
  final String address;
  final bool isDefault;

  AddNewAddressEvent({
    required this.title,
    required this.address,
    this.isDefault = false,
  });

  @override
  List<Object?> get props => [title, address, isDefault];
}
