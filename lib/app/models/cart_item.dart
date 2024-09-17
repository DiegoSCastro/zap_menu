import '../app.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

///CartItem Model
@freezed
class CartItem with _$CartItem {
  /// Constructor of [CartItem]
  const factory CartItem({
    @Default(Product()) Product product,
    @Default('') String notes,
    @Default(1) int quantity,
  }) = _CartItem;
  const CartItem._();

  /// Convert json [Map] in a [CartItem]
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
