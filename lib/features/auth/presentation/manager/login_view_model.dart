
import 'package:flutter/material.dart';

import '../../../../core/data/repository/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required AuthRepository repo,
  }) : _repo = repo;
  final AuthRepository _repo;
  final formKey = GlobalKey<FormState>();

  String? _errorMessage;

  bool get hasError => _errorMessage != null;

  String? get errorMessage => _errorMessage;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    try {
      await _repo.login(loginController.text, passwordController.text);
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }

    _errorMessage = null;
    notifyListeners();
    return true;
  }
}
