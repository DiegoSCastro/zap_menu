import 'package:freezed_annotation/freezed_annotation.dart';

import '../app.dart';

part 'product.freezed.dart';
part 'product.g.dart';

///Product Model
@freezed
class Product with _$Product {
  /// Constructor of [Product]
  const factory Product({
    @Default('') String name,
    @Default('') String description,
    @Default('') String ingredients,
    @Default('') String imagePath,
    @Default(0.0) double price,
    @Default([]) List<OptionalItem> optionals,
  }) = _Product;
  const Product._();

  /// Convert json [Map] in a [Product]
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static const List<Product> products = [
    Product(
      name: 'Hot Dog Simples',
      price: 12.0,
      ingredients:
          'Pão 17 cm, salsicha, molho de tomate, maionese, milho, batata palha.',
      description:
          'Clássico e saboroso! Salsicha suculenta com molho especial, milho e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Duplo',
      price: 15.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, milho, batata palha.',
      description:
          'O dobro de sabor! Duas salsichas com molho cremoso, milho e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Triplo',
      price: 18.0,
      ingredients:
          'Pão 17 cm, 3 salsichas, molho de tomate, maionese, milho, batata palha.',
      description:
          'Para os fãs de hot dog! Três salsichas com muito molho, milho e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Paulista',
      price: 23.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, purê de batata, vinagrete, milho, ervilha, batata palha.',
      description:
          'Inspirado no clássico paulista! Hot dog com purê cremoso, vinagrete e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Gaúcho',
      price: 24.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, ervilha, parmesão, batata palha.',
      description:
          'Sabor do Sul! Duas salsichas com queijo parmesão derretido, ervilha e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Cuiabano',
      price: 24.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, calabresa picada, milho, batata palha.',
      description:
          'Uma explosão de sabor! Salsichas com calabresa picante, milho e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Cremosinho',
      price: 25.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, requeijão cremoso, milho, batata palha.',
      description:
          'Extremamente cremoso! Hot dog com requeijão, milho e batata palha crocante.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog Mineirinho',
      price: 25.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, mussarela, queijo caipira, milho, batata palha.',
      description:
          'Sabor de Minas! Queijo caipira e mussarela derretida fazem desse hot dog irresistível.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Hot Dog MS',
      price: 25.0,
      ingredients:
          'Pão 17 cm, 2 salsichas, molho de tomate, maionese, mussarela, bacon crocante, milho, batata palha.',
      description:
          'Para os amantes de bacon! Mussarela derretida e bacon crocante deixam esse hot dog especial.',
      imagePath: 'assets/hotdog.jpeg',
    ),
    Product(
      name: 'Jantinha',
      price: 15.0,
      ingredients:
          'Espetinho de carne, arroz, mandioca e farofa. (Adicionar observações se quiser trocar por espetinho de frango)',
      description:
          'Uma refeição completa! Espetinho suculento com arroz soltinho, mandioca e farofa crocante.',
      imagePath: 'assets/jantinha.jpg',
    ),
    Product(
      name: 'Jantinha Completa',
      price: 17.0,
      ingredients:
          'Espetinho de carne, arroz, mandioca, vinagrete e farofa. (Adicionar observações se quiser trocar por espetinho de frango)',
      description:
          'Jantinha reforçada! Espetinho delicioso com arroz, mandioca, vinagrete e farofa temperada.',
      imagePath: 'assets/jantinha.jpg',
    ),
    Product(
      name: 'Jantinha Completa 2.0',
      price: 22.0,
      ingredients:
          '2 Espetinhos de carne, arroz, mandioca, vinagrete e farofa. (Adicionar observações se quiser trocar por espetinho de frango)',
      description:
          'Para quem tem fome! Dois espetinhos suculentos com acompanhamentos deliciosos.',
      imagePath: 'assets/jantinha.jpg',
    ),
    Product(
      name: 'Espetinho Carne',
      price: 8.0,
      ingredients: 'Espetinho de carne bovina',
      description: 'Carne macia e suculenta no espeto, assada na brasa.',
      imagePath: 'assets/carne.jpg',
    ),
    Product(
      name: 'Espetinho Frango',
      price: 8.0,
      ingredients: 'Espetinho de frango',
      description: 'Frango temperado e assado na brasa, macio e saboroso.',
      imagePath: 'assets/frango.jpg',
    ),
  ];

  // static const List<Product> products = [
  //   Product(
  //       name: 'Bife',
  //       description:
  //           'Bife suculento e bem temperado, preparado na chapa para manter o sabor e maciez.',
  //       price: 17.0,
  //       sideDishes: 'Arroz, feijão e salada do dia.',
  //       imagePath: 'assets/bife.webp',
  //       optionals: [
  //         OptionalItem(
  //           name: 'Arroz',
  //           price: 4.00,
  //           description: '+ 300 gramas de arroz',
  //         ),
  //         OptionalItem(
  //           name: 'Carne',
  //           price: 6.00,
  //           description: '+ 100 gramas de bife',
  //         ),
  //       ]),
  //   Product(
  //     name: 'Bife Acebolado',
  //     description:
  //         'Delicioso bife grelhado coberto com cebolas caramelizadas, garantindo um sabor irresistível.',
  //     price: 17.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/bife_acebolado.webp',
  //   ),
  //   Product(
  //     name: 'Bife a Cavalo',
  //     description:
  //         'Um clássico, bife grelhado com um ovo frito por cima, trazendo ainda mais sabor ao prato.',
  //     price: 20.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/bife_cavalo.webp',
  //   ),
  //   Product(
  //     name: 'Bife à Parmegiana',
  //     description:
  //         'Bife empanado coberto com molho de tomate e queijo gratinado, servido com um toque especial de sabor.',
  //     price: 30.0,
  //     sideDishes: 'Arroz, batata frita e salada do dia',
  //     imagePath: 'assets/bife_parmegiana.webp',
  //   ),
  //   Product(
  //     name: 'Bife à Milanesa',
  //     description:
  //         'Bife crocante empanado, perfeito para quem ama aquele sabor caseiro e crocante.',
  //     price: 20.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/bife_milanesa.webp',
  //   ),
  //   Product(
  //     name: 'Filé de Frango Acebolado',
  //     description:
  //         'Filé de frango grelhado com cebolas caramelizadas, uma combinação que não tem erro!',
  //     price: 17.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/frango_acebolado.webp',
  //   ),
  //   Product(
  //     name: 'Filé de Frango à Parmegiana',
  //     description:
  //         'Filé de frango empanado, coberto com molho de tomate e queijo derretido. Clássico e irresistível!',
  //     price: 20.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/frango_parmegiana.webp',
  //   ),
  //   Product(
  //     name: 'Filé de Frango Grelhado',
  //     description:
  //         'Frango grelhado na chapa, leve e saudável, perfeito para quem quer manter a dieta sem perder o sabor.',
  //     price: 17.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/frango_grelhado.webp',
  //   ),
  //   Product(
  //     name: 'Filé de Frango Empanado',
  //     description:
  //         'Filé de frango empanado, crocante e suculento, ideal para uma refeição rápida e saborosa.',
  //     price: 20.0,
  //     sideDishes: 'Arroz, feijão e salada do dia',
  //     imagePath: 'assets/frango_empanado.webp',
  //   ),
  //   Product(
  //     name: 'Caserinha',
  //     description:
  //         'Prato do dia, preparado com ingredientes frescos e temperos caseiros. Consulte a opção disponível!',
  //     price: 20.0,
  //     sideDishes: 'Consultar a opção do dia',
  //     imagePath: 'assets/caseirinha.webp',
  //   ),
  // ];
}
