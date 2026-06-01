import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mydetails_event.dart';
import 'mydetails_state.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
	final TextEditingController nameController = TextEditingController();
	final TextEditingController emailController = TextEditingController();
	final TextEditingController dateController = TextEditingController();
	final TextEditingController genderController = TextEditingController();
	final TextEditingController phoneController = TextEditingController();

	MyDetailsBloc() : super(_initialState()) {
		_initControllers();

		on<MyDetailsGenderSelected>(_onGenderSelected);
		on<MyDetailsCountrySelected>(_onCountrySelected);
		on<MyDetailsDateSelected>(_onDateSelected);
	}

	static MyDetailsState _initialState() {
		const genderOptions = ['Male', 'Female'];
		const countries = [
			CountryOption(name: 'Bangladesh', flag: '🇧🇩', dialCode: '+880'),
			CountryOption(name: 'United States', flag: '🇺🇸', dialCode: '+1'),
			CountryOption(name: 'India', flag: '🇮🇳', dialCode: '+91'),
			CountryOption(name: 'Pakistan', flag: '🇵🇰', dialCode: '+92'),
			CountryOption(name: 'United Kingdom', flag: '🇬🇧', dialCode: '+44'),
			CountryOption(name: 'Canada', flag: '🇨🇦', dialCode: '+1'),
			CountryOption(name: 'Australia', flag: '🇦🇺', dialCode: '+61'),
			CountryOption(name: 'UAE', flag: '🇦🇪', dialCode: '+971'),
			CountryOption(name: 'Saudi Arabia', flag: '🇸🇦', dialCode: '+966'),
			CountryOption(name: 'Malaysia', flag: '🇲🇾', dialCode: '+60'),
			CountryOption(name: 'Singapore', flag: '🇸🇬', dialCode: '+65'),
		];

		final defaultCountry = countries.first;
		return MyDetailsState(
			genderOptions: genderOptions,
			countries: countries,
			selectedGender: genderOptions.first,
			selectedCountry: defaultCountry,
			dateText: '12/07/1990',
		);
	}

	void _initControllers() {
		nameController.text = 'Cody Fisher';
		emailController.text = 'cody.fisher45@example';
		dateController.text = state.dateText;
		genderController.text = state.selectedGender;
		phoneController.text = '${state.selectedCountry.dialCode} 123 456 789';
	}

	void _onGenderSelected(
		MyDetailsGenderSelected event,
		Emitter<MyDetailsState> emit,
	) {
		genderController.text = event.gender;
		emit(state.copyWith(selectedGender: event.gender));
	}

	void _onCountrySelected(
		MyDetailsCountrySelected event,
		Emitter<MyDetailsState> emit,
	) {
		emit(state.copyWith(selectedCountry: event.country));
	}

	void _onDateSelected(
		MyDetailsDateSelected event,
		Emitter<MyDetailsState> emit,
	) {
		final text = formatDate(event.date);
		dateController.text = text;
		emit(state.copyWith(dateText: text));
	}

	DateTime? tryParseDate(String value) {
		final parts = value.split('/');
		if (parts.length != 3) return null;
		final day = int.tryParse(parts[0]);
		final month = int.tryParse(parts[1]);
		final year = int.tryParse(parts[2]);
		if (day == null || month == null || year == null) return null;
		return DateTime(year, month, day);
	}

	String formatDate(DateTime date) {
		final day = date.day.toString().padLeft(2, '0');
		final month = date.month.toString().padLeft(2, '0');
		final year = date.year.toString();
		return '$day/$month/$year';
	}

	@override
	Future<void> close() {
		nameController.dispose();
		emailController.dispose();
		dateController.dispose();
		genderController.dispose();
		phoneController.dispose();
		return super.close();
	}
}
