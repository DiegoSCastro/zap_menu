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
    @Default('') String sideDishes,
    @Default('') String imagePath,
    @Default(0.0) double price,
  }) = _Product;
  const Product._();

  /// Convert json [Map] in a [Product]
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static const List<Product> products = [
    Product(
      name: 'Bife',
      description:
          'Bife suculento e bem temperado, preparado na chapa para manter o sabor e maciez.',
      price: 17.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/bife.webp',
    ),
    Product(
      name: 'Bife Acebolado',
      description:
          'Delicioso bife grelhado coberto com cebolas caramelizadas, garantindo um sabor irresistível.',
      price: 17.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/bife_acebolado.webp',
    ),
    Product(
      name: 'Bife a Cavalo',
      description:
          'Um clássico, bife grelhado com um ovo frito por cima, trazendo ainda mais sabor ao prato.',
      price: 20.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/bife_cavalo.webp',
    ),
    Product(
      name: 'Bife à Parmegiana',
      description:
          'Bife empanado coberto com molho de tomate e queijo gratinado, servido com um toque especial de sabor.',
      price: 30.0,
      sideDishes: 'Arroz, batata frita e salada do dia',
      imagePath: 'assets/bife_parmegiana.webp',
    ),
    Product(
      name: 'Bife à Milanesa',
      description:
          'Bife crocante empanado, perfeito para quem ama aquele sabor caseiro e crocante.',
      price: 20.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/bife_milanesa.webp',
    ),
    Product(
      name: 'Filé de Frango Acebolado',
      description:
          'Filé de frango grelhado com cebolas caramelizadas, uma combinação que não tem erro!',
      price: 17.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/frango_acebolado.webp',
    ),
    Product(
      name: 'Filé de Frango à Parmegiana',
      description:
          'Filé de frango empanado, coberto com molho de tomate e queijo derretido. Clássico e irresistível!',
      price: 20.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/frango_parmegiana.webp',
    ),
    Product(
      name: 'Filé de Frango Grelhado',
      description:
          'Frango grelhado na chapa, leve e saudável, perfeito para quem quer manter a dieta sem perder o sabor.',
      price: 17.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/frango_grelhado.webp',
    ),
    Product(
      name: 'Filé de Frango Empanado',
      description:
          'Filé de frango empanado, crocante e suculento, ideal para uma refeição rápida e saborosa.',
      price: 20.0,
      sideDishes: 'Arroz, feijão e salada do dia',
      imagePath: 'assets/frango_empanado.webp',
    ),
    Product(
      name: 'Caserinha',
      description:
          'Prato do dia, preparado com ingredientes frescos e temperos caseiros. Consulte a opção disponível!',
      price: 20.0,
      sideDishes: 'Consultar a opção do dia',
      imagePath: 'assets/caseirinha.webp',
    ),
  ];
}
