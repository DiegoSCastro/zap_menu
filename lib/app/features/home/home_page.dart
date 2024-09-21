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
  static const _products = Product.products;

  late final CartCubit _cartCubit;

  @override
  void initState() {
    _cartCubit = context.read<CartCubit>();
    super.initState();
  }

  void _onTapItem(Product product) {
    _cartCubit.addToCart(
      CartItem(product: product, notes: ''),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('${product.name} adicionado a sacola'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(AppRoutes.cart),
        label: const Text('Ver Sacola'),
        icon: const Icon(Icons.shopping_basket_outlined),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final Product product = _products[index];
                    return HomeProductItem(
                      product: product,
                      onTap: () => _onTapItem(product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
