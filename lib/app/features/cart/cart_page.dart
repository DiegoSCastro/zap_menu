// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String generateOrderMessage({
    required List<CartItem> cartItems,
    required double totalCartValue,
  }) {
    StringBuffer message = StringBuffer();
    message.writeln('Olá, gostaria de fazer um pedido:');
    message.writeln();

    for (var item in cartItems) {
      message.writeln('${item.quantity}x ${item.product.name}');
      message.writeln(
          'Preço Unitário: R\$ ${item.product.price.toStringAsFixed(2)}');

      final optionalsGrouped = item.optionalsWithQuantity;
      if (optionalsGrouped.isNotEmpty) {
        message.writeln('Opcionais:');
        optionalsGrouped.forEach((optional, qty) {
          final totalOptionalPrice = optional.price * qty;
          message.writeln(
              '  ${qty}x ${optional.name} - R\$ ${totalOptionalPrice.toStringAsFixed(2)}');
        });
      }

      if (item.notes.isNotEmpty) {
        message.writeln('Observações: ${item.notes}');
      }

      message.writeln(
          'Total do Item: R\$ ${item.totalItemPrice.toStringAsFixed(2)}');
      message.writeln();
    }

    message.writeln('Valor Total: R\$ ${totalCartValue.toStringAsFixed(2)}');
    return message.toString();
  }

  void sendOrder({
    required List<CartItem> cartItems,
    required double totalCartValue,
  }) {
    String phoneNumber = '5567991742130';
    String message = Uri.encodeComponent(generateOrderMessage(
        cartItems: cartItems, totalCartValue: totalCartValue));
    String url = 'https://wa.me/$phoneNumber?text=$message';
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, List<CartItem>>(
      builder: (context, cartItems) {
        double totalCartValue = cartItems.fold(
            0, (total, item) => total + (item.product.price * item.quantity));

        return Scaffold(
          appBar: AppBar(
            title: const Text('Sacola'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final optionalsGrouped = item.optionalsWithQuantity;
                    double totalItemPrice = item.totalItemPrice;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Cabeçalho do item
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${item.quantity}x ${item.product.name}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Total: R\$ ${totalItemPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () => cartCubit.removeFromCart(item),
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                          Text(
                              'Preço Unitário: R\$ ${item.product.price.toStringAsFixed(2)}'),
                          if (optionalsGrouped.isNotEmpty)
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('Adicionais:'),
                            ),
                          ...optionalsGrouped.entries.map((entry) {
                            final optional = entry.key;
                            final qty = entry.value;
                            final totalOptionalPrice = optional.price * qty;
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 4.0),
                              child: Text(
                                '${qty}x ${optional.name} - R\$ ${totalOptionalPrice.toStringAsFixed(2)}',
                              ),
                            );
                          }),
                          // Observações, se houver
                          if (item.notes.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Observações: ${item.notes}'),
                            ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor Total: R\$ ${totalCartValue.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 56,
                      width: 200,
                      child: FilledButton(
                        onPressed: cartItems.isNotEmpty
                            ? () {
                                sendOrder(
                                    cartItems: cartItems,
                                    totalCartValue: totalCartValue);
                              }
                            : null,
                        child: const Text('Enviar pedido'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
