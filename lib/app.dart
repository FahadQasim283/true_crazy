import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/route_generator.dart';

class TrueCrazy extends StatefulWidget {
  const TrueCrazy({super.key});

  @override
  State<TrueCrazy> createState() => _TrueCrazyState();
}

class _TrueCrazyState extends State<TrueCrazy> {
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
