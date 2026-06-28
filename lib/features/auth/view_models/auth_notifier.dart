import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String? _username;
  String? get username => _username;

  String? _email;
  String? get email => _email;

  // Simulasi login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulasi delay API selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;

    // Cek kecocokan kredensial dummy
    if (email == 'admin@example.com' && password == 'password123') {
      _isLoggedIn = true;
      _email = email;
      _username = 'Administrator';
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  // Simulasi register
  Future<bool> register(String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulasi delay API selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    _isLoggedIn = true;
    _username = username;
    _email = email;

    notifyListeners();
    return true;
  }

  void logout() {
    _isLoggedIn = false;
    _username = null;
    _email = null;
    notifyListeners();
  }
}
