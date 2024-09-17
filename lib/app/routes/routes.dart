import '../app.dart';

sealed class AppRoutes {
  static const home = '/';
  static const cart = '/cart';

  static final routes = {
    home: (context) => const HomePage(),
    cart: (context) => const CartPage(),
  };
}
