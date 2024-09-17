import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zap_menu/app/routes/routes.dart';

import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = context.read<CartCubit>();
    const products = Product.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final Product product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Text(
                'R\$ ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Adicionar ao carrinho
                cartCubit.addToCart(
                  CartItem(product: product, notes: ''),
                );

                // Exibir Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} adicionado ao carrinho.'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
