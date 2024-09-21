import 'package:flutter/material.dart';

import '../../../app.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          Image.asset(
            AppAssets.logo,
            height: 80,
          ),
          Expanded(
            child: Text(
              'Cardápio',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(width: 60),
        ],
      ),
    );
  }
}
