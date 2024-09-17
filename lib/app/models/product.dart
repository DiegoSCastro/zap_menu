import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

///Product Model
@freezed
class Product with _$Product {
  /// Constructor of [Product]
  const factory Product({
    @Default('') String name,
    @Default('') String description,
    @Default(0.0) double price,
  }) = _Product;
  const Product._();

  /// Convert json [Map] in a [Product]
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static const List<Product> products = [
    Product(
        name: 'Marmita de Frango',
        price: 15.0,
        description: 'Frango grelhado com legumes.'),
    Product(
        name: 'Marmita Vegetariana',
        price: 12.0,
        description: 'Legumes frescos e arroz integral.'),
  ];
}
