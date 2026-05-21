import 'package:equatable/equatable.dart';

enum HomeState {initial, loading , success, failure}
class HomeStateData extends Equatable {
  final HomeState state;
  final String? errorMessage;

 const HomeStateData({required this.state, this.errorMessage});
  
  @override

  List<Object?> get props => [state, errorMessage]; 
}