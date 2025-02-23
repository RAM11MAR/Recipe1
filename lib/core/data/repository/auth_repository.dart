import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';

import '../../../features/auth/data/models/user_model.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;
  String? jwt;

  Future<bool> login(String login, String password) async {
    jwt = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveCredentials(login, password);
    await SecureStorage.saveToken(jwt!);
    return true;
  }

  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.signUp(
      UserModel(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        dateOfBirth: dateOfBirth,
      ),
    );
    return result;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials['login'] == null || credentials['password'] == null) {
      return false;
    }
    jwt = await client.login(credentials['login']!, credentials['password']!);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    return true;
  }
}
