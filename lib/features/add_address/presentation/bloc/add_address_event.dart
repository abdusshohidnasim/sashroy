import 'package:equatable/equatable.dart';

abstract class AddAddressEvent extends Equatable {
  const AddAddressEvent();

  @override
  List<Object?> get props => [];
}

class AddAddressNicknameChanged extends AddAddressEvent {
  final String nickname;
  const AddAddressNicknameChanged(this.nickname);

  @override
  List<Object?> get props => [nickname];
}

class AddAddressToggleDefault extends AddAddressEvent {
  const AddAddressToggleDefault();
}

class AddAddressSubmit extends AddAddressEvent {
  const AddAddressSubmit();


}
