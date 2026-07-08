import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sashroy/features/my_details/model/profile_model.dart';
import 'package:sashroy/networks/api_acess.dart';

import 'mydetails_event.dart';
import 'mydetails_state.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
	final TextEditingController dateController = TextEditingController();
	final TextEditingController genderController = TextEditingController();
	final TextEditingController phoneController = TextEditingController();
	final TextEditingController bioController = TextEditingController();
	final TextEditingController locationController = TextEditingController();
	final TextEditingController websiteController = TextEditingController();
	final TextEditingController facebookController = TextEditingController();
	final TextEditingController instagramController = TextEditingController();

	MyDetailsBloc() : super(_initialState()) {
		_initControllers();

		on<MyDetailsGenderSelected>(_onGenderSelected);
		on<MyDetailsCountrySelected>(_onCountrySelected);
		on<MyDetailsDateSelected>(_onDateSelected);
		on<FetchProfile>(_onFetchProfile);
		on<SubmitProfile>(_onSubmitProfile);

		add(const FetchProfile());
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
		dateController.text = state.dateText;
		genderController.text = state.selectedGender;
		phoneController.text = '';
		bioController.text = '';
		locationController.text = '';
		websiteController.text = '';
		facebookController.text = '';
		instagramController.text = '';
	}

	Future<void> _onFetchProfile(
		FetchProfile event,
		Emitter<MyDetailsState> emit,
	) async {
		emit(state.copyWith(status: MyDetailsStatus.loading));
		try {
			final success = await getProfileRxObj.fetchfunctionName();
			if (success) {
				final ProfileModel profile = getProfileRxObj.dataFetcher.value;

				dateController.text = formatDate(profile.dateOfBirth);
				genderController.text = profile.gender;
				bioController.text = profile.bio;
				locationController.text = profile.location;
				websiteController.text = profile.website;
				facebookController.text = profile.socialLinks.facebook;
				instagramController.text = profile.socialLinks.instagram;

				// Find matching country
				CountryOption matchedCountry = state.countries.first;
				String displayPhoneNumber = profile.phoneNumber;
				for (final country in state.countries) {
					if (profile.phoneNumber.startsWith(country.dialCode)) {
						matchedCountry = country;
						displayPhoneNumber = profile.phoneNumber.substring(country.dialCode.length).trim();
						break;
					}
				}
				phoneController.text = displayPhoneNumber;

				emit(state.copyWith(
					status: MyDetailsStatus.success,
					selectedGender: profile.gender,
					selectedCountry: matchedCountry,
					dateText: formatDate(profile.dateOfBirth),
				));
			} else {
				emit(state.copyWith(
					status: MyDetailsStatus.failure,
					errorMessage: "Failed to fetch profile",
				));
			}
		} catch (e) {
			emit(state.copyWith(
				status: MyDetailsStatus.failure,
				errorMessage: e.toString(),
			));
		}
	}

	Future<void> _onSubmitProfile(
		SubmitProfile event,
		Emitter<MyDetailsState> emit,
	) async {
		emit(state.copyWith(status: MyDetailsStatus.loading));
		try {
			final parsedDate = tryParseDate(dateController.text);
			final dateOfBirthStr = parsedDate != null
					? "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}"
					: "";

			final fullPhoneNumber = "${state.selectedCountry.dialCode}${phoneController.text.trim()}";

			final success = await postProfileRxObj.post(
				bio: bioController.text.trim(),
				location: locationController.text.trim(),
				website: websiteController.text.trim(),
				phoneNumber: fullPhoneNumber,
				gender: genderController.text.trim(),
				dateOfBirth: dateOfBirthStr,
				facebook: facebookController.text.trim(),
				instagram: instagramController.text.trim(),
			);

			if (success) {
				emit(state.copyWith(status: MyDetailsStatus.success));
				add(const FetchProfile());
			} else {
				emit(state.copyWith(
					status: MyDetailsStatus.failure,
					errorMessage: "Failed to update profile",
				));
			}
		} catch (e) {
			emit(state.copyWith(
				status: MyDetailsStatus.failure,
				errorMessage: e.toString(),
			));
		}
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
		dateController.dispose();
		genderController.dispose();
		phoneController.dispose();
		bioController.dispose();
		locationController.dispose();
		websiteController.dispose();
		facebookController.dispose();
		instagramController.dispose();
		return super.close();
	}
}
