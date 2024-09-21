import 'package:flutter/material.dart';

import '../../../app.dart';

class HomeProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const HomeProductItem({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imagePath,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: context.textTheme.titleMedium,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              product.description,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.gray),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
