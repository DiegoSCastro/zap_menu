import '../app.dart';

sealed class AppRoutes {
  static const home = '/';
  static const detail = '/detalhes';
  static const cart = '/sacola';

  static final routes = {
    home: (context) => const HomePage(),
    detail: (context) => const DetailPage(),
    cart: (context) => const CartPage(),
  };
}
