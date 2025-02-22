import 'package:flutter/material.dart';
import 'package:zap_menu/app/routes/routes.dart';

import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _products = Product.products;

  // late final CartCubit _cartCubit;

  @override
  void initState() {
    // _cartCubit = context.read<CartCubit>();
    super.initState();
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
                  padding: const EdgeInsets.only(bottom: 80),
                  itemBuilder: (context, index) {
                    final Product product = _products[index];
                    return HomeProductItem(
                      product: product,
                      onTap: () => context.pushNamed(
                        AppRoutes.detail,
                        arguments: product,
                      ),
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
