import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    // Simulasi delay API selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@example.com' && password == 'password123') {
      emit(AuthSuccess(username: 'Administrator', email: email));
    } else {
      emit(AuthFailure(errorMessage: 'Email atau password salah. Coba lagi.'));
    }
  }

  Future<void> register(String username, String email, String password) async {
    emit(AuthLoading());

    // Simulasi delay API selama 2 detik
    await Future.delayed(const Duration(seconds: 2));

    emit(AuthSuccess(username: username, email: email));
  }

  void logout() {
    emit(AuthInitial());
  }
}
