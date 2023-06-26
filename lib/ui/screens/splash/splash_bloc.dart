// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_provider_shop/domain/repository/api_repository.dart';
import 'package:flutter_provider_shop/domain/repository/local_storage_repository.dart';

class SplashBloc extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  SplashBloc({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  Future<bool> validateSession() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      return true;
    } else {
      return false;
    }
  }
}
