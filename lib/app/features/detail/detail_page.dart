import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zap_menu/app/app.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _$DetailPageState();
}

class _$DetailPageState extends State<DetailPage> {
  late final Product _product;
  late final CartCubit _cartCubit;
  int quantity = 1;
  final List<OptionalItem> _selectedOptionals = [];
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    _cartCubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _product = ModalRoute.of(context)?.settings.arguments as Product;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _incrementOptional(OptionalItem optional) {
    setState(() {
      _selectedOptionals.add(optional);
    });
  }

  void _decrementOptional(OptionalItem optional) {
    setState(() {
      _selectedOptionals.remove(optional);
    });
  }

  int _getOptionalQuantity(OptionalItem optional) {
    return _selectedOptionals.where((item) => item == optional).length;
  }

  double get _calculateTotalPrice {
    double optionalsTotal =
        _selectedOptionals.fold(0.0, (sum, optional) => sum + optional.price);
    double productTotal = _product.price;
    double total = (productTotal + optionalsTotal) * quantity;
    return total;
  }

  void _onAddItem() {
    _cartCubit.addToCart(
      CartItem(
        product: _product,
        notes: _notesController.text,
        quantity: quantity,
        selectedOptionals: _selectedOptionals,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('${_product.name} adicionado a sacola de compras'),
        duration: const Duration(seconds: 2),
      ),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(_product.imagePath),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        _product.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _product.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.gray),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _product.sideDishes,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _product.price.formattedCurrencyBR,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      // Seção de Opcionais
                      if (_product.optionals.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Adicionais',
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _product.optionals.length,
                          itemBuilder: (context, index) {
                            final optional = _product.optionals[index];
                            final qty = _getOptionalQuantity(optional);
                            return ListTile(
                              title: Row(
                                children: [
                                  Text(optional.name),
                                  const SizedBox(width: 16),
                                  if (optional.description != '')
                                    Text(
                                      '(${optional.description})',
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(color: AppColors.gray),
                                    )
                                ],
                              ),
                              subtitle:
                                  Text(optional.price.formattedCurrencyBR),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (qty > 0)
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () =>
                                          _decrementOptional(optional),
                                    ),
                                  Text(qty.toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () =>
                                        _incrementOptional(optional),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                      const SizedBox(height: 16),
                      // Campo de Observações
                      TextField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: 'Observações',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity > 1
                          ? () => setState(() => quantity--)
                          : null,
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    'Total: ${_calculateTotalPrice.formattedCurrencyBR}',
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 56,
                  child: FilledButton(
                    onPressed: _onAddItem,
                    child: const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
