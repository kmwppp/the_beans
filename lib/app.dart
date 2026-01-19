import 'package:flutter/material.dart';
import 'package:thebeans/core/theme/app_theme.dart';
import 'package:thebeans/routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: AppTheme.primary(),
    );
  }
}
