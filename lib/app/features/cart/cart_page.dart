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
    for (var item in cartItems) {
      message.writeln(
          '${item.quantity}x ${item.product.name} - R\$ ${(item.product.price * item.quantity).toStringAsFixed(2)}');
    }
    message.writeln('Total: R\$ ${totalCartValue.toStringAsFixed(2)}');
    // Adicione observações se necessário
    return message.toString();
  }

  void sendOrder({
    required List<CartItem> cartItems,
    required double totalCartValue,
  }) {
    String phoneNumber = '556792873913';
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
                    double totalItemPrice = item.product.price * item.quantity;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.product.name),
                                Text(
                                    'Quantidade: ${item.quantity} x R\$ ${item.product.price.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                  'Total: R\$ ${totalItemPrice.toStringAsFixed(2)}'),
                              IconButton(
                                onPressed: () => cartCubit.removeFromCart(item),
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: context.colorScheme.error,
                                ),
                              ),
                            ],
                          )
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
