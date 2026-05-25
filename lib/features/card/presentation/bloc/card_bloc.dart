import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cart_item_model.dart';
import 'card_event.dart';
import 'card_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<LoadCartEvent>(_onLoadCart);
    on<IncrementQuantityEvent>(_onIncrementQuantity);
    on<DecrementQuantityEvent>(_onDecrementQuantity);
    on<RemoveCartItemEvent>(_onRemoveCartItem);
  }

  void _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) {
    emit(state.copyWith(status: CartStatus.loading, errorMessage: null));

    emit(
      state.copyWith(
        status: CartStatus.loaded,
        cartItems: _seedItems(),
        errorMessage: null,
      ),
    );
  }

  void _onIncrementQuantity(
    IncrementQuantityEvent event,
    Emitter<CartState> emit,
  ) {
    final updatedItems = state.cartItems.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    emit(
      state.copyWith(
        status: CartStatus.loaded,
        cartItems: updatedItems,
        errorMessage: null,
      ),
    );
  }

  void _onDecrementQuantity(
    DecrementQuantityEvent event,
    Emitter<CartState> emit,
  ) {
    final updatedItems = state.cartItems.map((item) {
      if (item.id == event.itemId) {
        final nextQuantity = item.quantity > 1 ? item.quantity - 1 : 1;
        return item.copyWith(quantity: nextQuantity);
      }
      return item;
    }).toList();

    emit(
      state.copyWith(
        status: CartStatus.loaded,
        cartItems: updatedItems,
        errorMessage: null,
      ),
    );
  }

  void _onRemoveCartItem(
    RemoveCartItemEvent event,
    Emitter<CartState> emit,
  ) {
    final updatedItems =
        state.cartItems.where((item) => item.id != event.itemId).toList();

    emit(
      state.copyWith(
        status: CartStatus.loaded,
        cartItems: updatedItems,
        errorMessage: null,
      ),
    );
  }

  List<CartItemModel> _seedItems() {
    return const [
      CartItemModel(
        id: 1,
        name: 'Casual T-Shirt',
        image: 'assets/images/sale.png',
        size: 'M',
        price: 1200.0,
        quantity: 1,
      ),
      CartItemModel(
        id: 2,
        name: 'Sport Sneakers',
        image: 'assets/images/ULTIMATE.png',
        size: '42',
        price: 3500.0,
        quantity: 1,
      ),
    ];
  }
}
