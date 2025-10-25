import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/route_generator.dart';

class TrulyCrazy extends StatefulWidget {
  const TrulyCrazy({super.key});

  @override
  State<TrulyCrazy> createState() => _TrulyCrazyState();
}

class _TrulyCrazyState extends State<TrulyCrazy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: RouteGenerator.router,
    );
  }
}
