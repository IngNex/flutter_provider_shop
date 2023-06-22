import 'package:flutter/material.dart';
import 'package:flutter_provider_shop/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provider - Clean Architecture AppShop',
      home: SplashScreen(),
    );
  }
}
