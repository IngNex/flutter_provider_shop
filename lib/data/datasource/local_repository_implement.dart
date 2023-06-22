import 'package:flutter_provider_shop/domain/model/user_model.dart';
import 'package:flutter_provider_shop/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_email = 'EMAIL';
const _pref_password = 'PASSWORD';
const _pref_image = 'IMAGE';
const _pref_dark_theme = 'THEME_DARK';

class LocalRepositoryImplement extends LocalRepositoryInterface {
  Future<SharedPreferences> _sharedPreference = SharedPreferences.getInstance();
  @override
  Future<void> clearAllData() async {
    final SharedPreferences sharedPreferences = await _sharedPreference;
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    final SharedPreferences sharedPreferences = await _sharedPreference;
    final token = sharedPreferences.getString(_pref_token);
    return token ?? _pref_token;
  }

  @override
  Future<String> saveToken(String token) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setString(_pref_token, token);

    return token;
  }

  @override
  Future<User> getUser() async {
    final SharedPreferences sharedPreferences = await _sharedPreference;
    final username = sharedPreferences.getString(_pref_username);
    final name = sharedPreferences.getString(_pref_name);
    final email = sharedPreferences.getString(_pref_email);
    final image = sharedPreferences.getString(_pref_image);

    final user = User(
      name: username.toString(),
      username: name.toString(),
      email: email.toString(),
      image: image.toString(),
    );

    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setString(_pref_username, user.username);
    sharedPreference.setString(_pref_name, user.name);
    sharedPreference.setString(_pref_image, user.image);

    return user;
  }

  @override
  Future<bool> isDarkMode() async {
    final SharedPreferences sharedPreferences = await _sharedPreference;
    return sharedPreferences.getBool(_pref_dark_theme) ?? false;
  }

  @override
  Future<void> saveDarkMode(bool darkMode) async {
    final SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setBool(_pref_dark_theme, darkMode);
  }
}
