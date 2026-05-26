import 'package:equatable/equatable.dart';

import 'my_details_state.dart';

abstract class MyDetailsEvent extends Equatable {
  const MyDetailsEvent();

  @override
  List<Object?> get props => [];
}

class MyDetailsGenderChanged extends MyDetailsEvent {
  final String gender;
  const MyDetailsGenderChanged(this.gender);

  @override
  List<Object?> get props => [gender];
}

class MyDetailsCountryChanged extends MyDetailsEvent {
  final CountryOption country;
  const MyDetailsCountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}

class MyDetailsDateChanged extends MyDetailsEvent {
  final DateTime date;
  const MyDetailsDateChanged(this.date);

  @override
  List<Object?> get props => [date];
}

class MyDetailsSubmitted extends MyDetailsEvent {
  const MyDetailsSubmitted();
}
