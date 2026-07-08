import 'package:equatable/equatable.dart';

import 'mydetails_state.dart';

abstract class MyDetailsEvent extends Equatable {
	const MyDetailsEvent();

	@override
	List<Object?> get props => [];
}

class MyDetailsGenderSelected extends MyDetailsEvent {
	final String gender;

	const MyDetailsGenderSelected(this.gender);

	@override
	List<Object?> get props => [gender];
}

class MyDetailsCountrySelected extends MyDetailsEvent {
	final CountryOption country;

	const MyDetailsCountrySelected(this.country);

	@override
	List<Object?> get props => [country];
}

class MyDetailsDateSelected extends MyDetailsEvent {
	final DateTime date;

	const MyDetailsDateSelected(this.date);

	@override
	List<Object?> get props => [date];
}

class FetchProfile extends MyDetailsEvent {
	const FetchProfile();
}

class SubmitProfile extends MyDetailsEvent {
	const SubmitProfile();
}
