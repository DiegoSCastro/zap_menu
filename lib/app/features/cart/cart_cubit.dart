import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(CartItem item) {
    final List<CartItem> updatedCart = List.from(state);
    final int index =
        updatedCart.indexWhere((i) => i.product.name == item.product.name);

    if (index >= 0) {
      final existingItem = updatedCart[index];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );
      updatedCart[index] = updatedItem;
    } else {
      updatedCart.add(item);
    }

    emit(updatedCart);
  }

  void removeFromCart(CartItem item) {
    final List<CartItem> updatedCart = List.from(state);
    updatedCart.removeWhere((i) => i.product.name == item.product.name);
    emit(updatedCart);
  }

  void clearCart() {
    emit([]);
  }
}
