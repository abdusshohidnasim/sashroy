import 'package:equatable/equatable.dart';

enum MyDetailsStatus { initial, submitting, success, failure }

class CountryOption extends Equatable {
  final String name;
  final String dialCode;
  final String flag;

  const CountryOption({
    required this.name,
    required this.dialCode,
    required this.flag,
  });

  @override
  List<Object?> get props => [name, dialCode, flag];
}

class MyDetailsState extends Equatable {
  static const CountryOption defaultCountry = CountryOption(
    name: 'United States',
    dialCode: '+1',
    flag: '🇺🇸',
  );

  final String selectedGender;
  final CountryOption selectedCountry;
  final String dateOfBirth;
  final MyDetailsStatus status;
  final String? errorMessage;

  const MyDetailsState({
    this.selectedGender = 'Male',
    this.selectedCountry = defaultCountry,
    this.dateOfBirth = '12/07/1990',
    this.status = MyDetailsStatus.initial,
    this.errorMessage,
  });

  MyDetailsState copyWith({
    String? selectedGender,
    CountryOption? selectedCountry,
    String? dateOfBirth,
    MyDetailsStatus? status,
    String? errorMessage,
  }) {
    return MyDetailsState(
      selectedGender: selectedGender ?? this.selectedGender,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedGender,
        selectedCountry,
        dateOfBirth,
        status,
        errorMessage,
      ];
}
