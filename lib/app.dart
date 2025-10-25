import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';

class TrueCrazy extends StatefulWidget {
  const TrueCrazy({super.key});

  @override
  State<TrueCrazy> createState() => _TrueCrazyState();
}

class _TrueCrazyState extends State<TrueCrazy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      home: Scaffold(
        appBar: AppBar(title: const Text('True Crazy App')),
        body: const Center(child: Text('Welcome to the True Crazy App!')),
      ),
    );
  }
}
