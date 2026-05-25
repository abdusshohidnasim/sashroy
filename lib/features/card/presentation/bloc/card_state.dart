import 'package:equatable/equatable.dart';
import '../../model/cart_item_model.dart';

enum CartStatus { initial, loading, loaded, error }

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItemModel> cartItems;
  final double shippingFee;
  final double vatPercent;
  final String? errorMessage;

  const CartState({
    this.status = CartStatus.initial,
    this.cartItems = const [],
    this.shippingFee = 80.0,
    this.vatPercent = 0.0,
    this.errorMessage,
  });

  /// Sub-total calculate
  double get subTotal {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  /// VAT amount
  double get vatAmount => subTotal * (vatPercent / 100);

  /// Grand total
  double get total => subTotal + vatAmount + shippingFee;

  /// Cart empty কিনা check
  bool get isEmpty => cartItems.isEmpty;

  /// Total items count
  int get totalItems {
    int count = 0;
    for (var item in cartItems) {
      count += item.quantity;
    }
    return count;
  }

  CartState copyWith({
    CartStatus? status,
    List<CartItemModel>? cartItems,
    double? shippingFee,
    double? vatPercent,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      shippingFee: shippingFee ?? this.shippingFee,
      vatPercent: vatPercent ?? this.vatPercent,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cartItems,
        shippingFee,
        vatPercent,
        errorMessage,
      ];
}
