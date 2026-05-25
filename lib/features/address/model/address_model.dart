import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final int id;
  final String title;
  final String address;
  final bool isDefault;

  const AddressModel({
    required this.id,
    required this.title,
    required this.address,
    required this.isDefault,
  });

  AddressModel copyWith({
    int? id,
    String? title,
    String? address,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      title: title ?? this.title,
      address: address ?? this.address,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  List<Object?> get props => [id, title, address, isDefault];
}

