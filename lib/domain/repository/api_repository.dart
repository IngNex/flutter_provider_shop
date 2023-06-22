import 'package:flutter_provider_shop/domain/model/products_model.dart';
import 'package:flutter_provider_shop/domain/model/user_model.dart';
import 'package:flutter_provider_shop/domain/request/login_request.dart';
import 'package:flutter_provider_shop/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Products>> getProducts();
}
