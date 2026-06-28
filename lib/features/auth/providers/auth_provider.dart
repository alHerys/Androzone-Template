import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState();
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi delay API 2 detik
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@example.com' && password == 'password123') {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        email: email,
        username: 'Administrator',
      );
      return true;
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Email atau password salah. Coba lagi.',
      );
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulasi delay API 2 detik
    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(
      isLoading: false,
      isLoggedIn: true,
      username: username,
      email: email,
    );
    return true;
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
