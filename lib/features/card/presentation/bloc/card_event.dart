import 'package:equatable/equatable.dart';

abstract class CartEvent
    extends Equatable {
  @override
  List<Object?> get props =>
      [];
}

/// Cart items load করার জন্য (API call এর জন্য ready)
class LoadCartEvent
    extends CartEvent {}

/// Item এর quantity বাড়ানোর জন্য
class IncrementQuantityEvent
    extends CartEvent {
  final int
      itemId;

  IncrementQuantityEvent(
      {required this.itemId});

  @override
  List<Object?> get props =>
      [
        itemId
      ];
}

/// Item এর quantity কমানোর জন্য
class DecrementQuantityEvent
    extends CartEvent {
  final int
      itemId;

  DecrementQuantityEvent(
      {required this.itemId});

  @override
  List<Object?> get props =>
      [
        itemId
      ];
}

/// Cart থেকে item delete করার জন্য
class RemoveCartItemEvent
    extends CartEvent {
  final int
      itemId;

  RemoveCartItemEvent(
      {required this.itemId});

  @override
  List<Object?> get props =>
      [
        itemId
      ];
}
