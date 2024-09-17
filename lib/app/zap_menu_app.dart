import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zap_menu/app/routes/routes.dart';

import 'app.dart';

class ZapMenuApp extends StatelessWidget {
  const ZapMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
        title: 'Zap Menu',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
