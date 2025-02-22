import '../../app.dart';

extension CartItemExtension on CartItem {
  Map<OptionalItem, int> get optionalsWithQuantity {
    Map<OptionalItem, int> groupedOptionals = {};

    for (var optional in selectedOptionals) {
      if (groupedOptionals.containsKey(optional)) {
        groupedOptionals[optional] = groupedOptionals[optional]! + 1;
      } else {
        groupedOptionals[optional] = 1;
      }
    }

    return groupedOptionals;
  }

  double get totalItemPrice {
    double optionalsTotal =
        selectedOptionals.fold(0.0, (sum, optional) => sum + optional.price);
    double itemTotal = (product.price + optionalsTotal) * quantity;
    return itemTotal;
  }
}
