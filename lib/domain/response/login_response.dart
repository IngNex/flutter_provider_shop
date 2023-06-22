import 'package:flutter_provider_shop/domain/model/user_model.dart';

class LoginResponse {
  final String token;
  final User user;
  LoginResponse({
    required this.token,
    required this.user,
  });
}
