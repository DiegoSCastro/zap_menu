import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

class ZapMenuApp extends StatelessWidget {
  const ZapMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        title: 'Zap Menu',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        home: const HomePage(),
      ),
    );
  }
}
