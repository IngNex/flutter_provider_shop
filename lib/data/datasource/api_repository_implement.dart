import 'package:flutter_provider_shop/data/products/in_memory_products_data.dart';
import 'package:flutter_provider_shop/domain/exception/exception.dart';
import 'package:flutter_provider_shop/domain/model/products_model.dart';
import 'package:flutter_provider_shop/domain/model/user_model.dart';
import 'package:flutter_provider_shop/domain/repository/api_repository.dart';
import 'package:flutter_provider_shop/domain/request/login_request.dart';
import 'package:flutter_provider_shop/domain/response/login_response.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'tokenmichael') {
      return User(
        name: 'Michael Rodriguez',
        username: 'maicoldev',
        email: 'michael@ingnex.com',
        image: 'assets/images/ingnex.png',
      );
    } else if (token == 'tokenkatherinne') {
      return User(
        name: 'Katherinne Soriano',
        username: 'lesly',
        email: 'lesly@ingnex.com',
        image: 'assets/icons/ingnex.png',
      );
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'maicoldev' && login.password == 'maicoldev') {
      return LoginResponse(
        token: 'tokenmichael',
        user: User(
          name: 'Michael Rodriguez',
          username: 'maicoldev',
          email: 'michael@ingnex.com',
          image: 'assets/images/ingnex.png',
        ),
      );
    } else if (login.username == 'lesly' && login.password == 'lesly') {
      return LoginResponse(
        token: 'tokenkatherinne',
        user: User(
          name: 'Katherinne Soriano',
          username: 'lesly',
          email: 'lesly@ingnex.com',
          image: 'assets/icons/ingnex.png',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Removing $token');
    return;
  }

  @override
  Future<List<Products>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
