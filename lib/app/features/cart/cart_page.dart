// cart_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartItems) {
          double totalCartValue = cartItems.fold(
              0, (total, item) => total + (item.product.price * item.quantity));

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    double totalItemPrice = item.product.price * item.quantity;
                    return ListTile(
                      title: Text(item.product.name),
                      subtitle: Text(
                          'Quantidade: ${item.quantity} x R\$ ${item.product.price.toStringAsFixed(2)}'),
                      trailing: Text(
                          'Total: R\$ ${totalItemPrice.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Valor Total: R\$ ${totalCartValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
