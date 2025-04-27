import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Регистрация пользователя
  Future<User?> register(String email, String password, String name, String surname) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Обновляем имя пользователя
      await userCredential.user?.updateDisplayName('$name $surname');
      await userCredential.user?.reload(); // Чтобы изменения применились

      return _auth.currentUser;
    } catch (e) {
      print('Ошибка при регистрации: $e');
      return null;
    }
  }

  // Вход пользователя
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Ошибка при входе: $e');
      return null;
    }
  }

  // Получить текущего пользователя
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  // Выход пользователя
  Future<void> logout() async {
    await _auth.signOut();
  }
}
