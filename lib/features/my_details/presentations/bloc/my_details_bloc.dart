import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_details_event.dart';
import 'my_details_state.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
  static const List<CountryOption> countryOptions = [
    CountryOption(name: 'United States', dialCode: '+1', flag: '🇺🇸'),
    CountryOption(name: 'United Kingdom', dialCode: '+44', flag: '🇬🇧'),
    CountryOption(name: 'Canada', dialCode: '+1', flag: '🇨🇦'),
    CountryOption(name: 'Bangladesh', dialCode: '+880', flag: '🇧🇩'),
    CountryOption(name: 'India', dialCode: '+91', flag: '🇮🇳'),
    CountryOption(name: 'Pakistan', dialCode: '+92', flag: '🇵🇰'),
    CountryOption(name: 'United Arab Emirates', dialCode: '+971', flag: '🇦🇪'),
    CountryOption(name: 'Saudi Arabia', dialCode: '+966', flag: '🇸🇦'),
    CountryOption(name: 'Australia', dialCode: '+61', flag: '🇦🇺'),
    CountryOption(name: 'Germany', dialCode: '+49', flag: '🇩🇪'),
    CountryOption(name: 'France', dialCode: '+33', flag: '🇫🇷'),
    CountryOption(name: 'Japan', dialCode: '+81', flag: '🇯🇵'),
    CountryOption(name: 'Singapore', dialCode: '+65', flag: '🇸🇬'),
    CountryOption(name: 'Malaysia', dialCode: '+60', flag: '🇲🇾'),
    CountryOption(name: 'Nepal', dialCode: '+977', flag: '🇳🇵'),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  MyDetailsBloc() : super(const MyDetailsState()) {
    nameController.text = 'Cody Fisher';
    emailController.text = 'cody.fisher45@example';
    dateController.text = state.dateOfBirth;
    phoneController.text = '+1 234 453 231 506';

    on<MyDetailsGenderChanged>(_onGenderChanged);
    on<MyDetailsCountryChanged>(_onCountryChanged);
    on<MyDetailsDateChanged>(_onDateChanged);
    on<MyDetailsSubmitted>(_onSubmitted);
  }

  void _onGenderChanged(
    MyDetailsGenderChanged event,
    Emitter<MyDetailsState> emit,
  ) {
    emit(state.copyWith(
      selectedGender: event.gender,
      status: MyDetailsStatus.initial,
      errorMessage: null,
    ));
  }

  void _onCountryChanged(
    MyDetailsCountryChanged event,
    Emitter<MyDetailsState> emit,
  ) {
    if (phoneController.text.trim().isEmpty) {
      phoneController.text = '${event.country.dialCode} ';
    }

    emit(state.copyWith(
      selectedCountry: event.country,
      status: MyDetailsStatus.initial,
      errorMessage: null,
    ));
  }

  void _onDateChanged(
    MyDetailsDateChanged event,
    Emitter<MyDetailsState> emit,
  ) {
    final formattedDate = _formatDate(event.date);
    dateController.text = formattedDate;
    emit(state.copyWith(
      dateOfBirth: formattedDate,
      status: MyDetailsStatus.initial,
      errorMessage: null,
    ));
  }

  void _onSubmitted(
    MyDetailsSubmitted event,
    Emitter<MyDetailsState> emit,
  ) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final date = dateController.text.trim();

    if (name.isEmpty) {
      emit(state.copyWith(
        status: MyDetailsStatus.failure,
        errorMessage: 'Please enter your name',
      ));
      return;
    }

    if (email.isEmpty || !email.contains('@')) {
      emit(state.copyWith(
        status: MyDetailsStatus.failure,
        errorMessage: 'Please enter a valid email',
      ));
      return;
    }

    if (date.isEmpty) {
      emit(state.copyWith(
        status: MyDetailsStatus.failure,
        errorMessage: 'Please select your date of birth',
      ));
      return;
    }

    if (phone.isEmpty) {
      emit(state.copyWith(
        status: MyDetailsStatus.failure,
        errorMessage: 'Please enter your phone number',
      ));
      return;
    }

    emit(state.copyWith(status: MyDetailsStatus.submitting));
    emit(state.copyWith(
      status: MyDetailsStatus.success,
      errorMessage: null,
    ));
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    dateController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
