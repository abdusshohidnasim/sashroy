import 'package:equatable/equatable.dart';

enum AddAddressStatus { initial, submitting, success, failure }

class AddAddressState extends Equatable {
  final String selectedNickname;
  final bool makeDefault;
  final AddAddressStatus status;
  final String? errorMessage;
  final List<String> availableNicknames;

  const AddAddressState({
    this.selectedNickname = 'Home',
    this.makeDefault = false,
    this.status = AddAddressStatus.initial,
    this.errorMessage,
    this.availableNicknames = const [
      'Home',
      'Office',
      'Apartment',
      "Parent's House",
    ],
  });

  AddAddressState copyWith({
    String? selectedNickname,
    bool? makeDefault,
    AddAddressStatus? status,
    String? errorMessage,
    List<String>? availableNicknames,
  }) {
    return AddAddressState(
      selectedNickname: selectedNickname ?? this.selectedNickname,
      makeDefault: makeDefault ?? this.makeDefault,
      status: status ?? this.status,
      errorMessage: errorMessage,
      availableNicknames: availableNicknames ?? this.availableNicknames,
    );
  }

  @override
  List<Object?> get props => [
        selectedNickname,
        makeDefault,
        status,
        errorMessage,
        availableNicknames,
      ];
}
