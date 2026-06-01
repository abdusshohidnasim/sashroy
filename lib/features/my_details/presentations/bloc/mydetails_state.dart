import 'package:equatable/equatable.dart';

class CountryOption extends Equatable {
	final String name;
	final String flag;
	final String dialCode;

	const CountryOption({
		required this.name,
		required this.flag,
		required this.dialCode,
	});

	@override
	List<Object?> get props => [name, flag, dialCode];
}

class MyDetailsState extends Equatable {
	final List<String> genderOptions;
	final List<CountryOption> countries;
	final String selectedGender;
	final CountryOption selectedCountry;
	final String dateText;

	const MyDetailsState({
		required this.genderOptions,
		required this.countries,
		required this.selectedGender,
		required this.selectedCountry,
		required this.dateText,
	});

	MyDetailsState copyWith({
		List<String>? genderOptions,
		List<CountryOption>? countries,
		String? selectedGender,
		CountryOption? selectedCountry,
		String? dateText,
	}) {
		return MyDetailsState(
			genderOptions: genderOptions ?? this.genderOptions,
			countries: countries ?? this.countries,
			selectedGender: selectedGender ?? this.selectedGender,
			selectedCountry: selectedCountry ?? this.selectedCountry,
			dateText: dateText ?? this.dateText,
		);
	}

	@override
	List<Object?> get props => [
				genderOptions,
				countries,
				selectedGender,
				selectedCountry,
				dateText,
			];
}
