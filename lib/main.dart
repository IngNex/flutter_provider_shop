import 'package:flutter/material.dart';
import 'package:flutter_provider_shop/data/datasource/api_repository_implement.dart';
import 'package:flutter_provider_shop/data/datasource/local_repository_implement.dart';
import 'package:flutter_provider_shop/domain/repository/api_repository.dart';
import 'package:flutter_provider_shop/domain/repository/local_storage_repository.dart';
import 'package:flutter_provider_shop/ui/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImplement(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImplement(),
        ),
      ],
      child: Builder(builder: (newContext) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider - Clean Architecture AppShop',
          home: SplashScreen.init(newContext),
        );
      }),
    );
  }
}
