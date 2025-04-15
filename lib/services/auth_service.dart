import 'package:flutter_lab_7/models/user.dart';
import 'package:flutter_lab_7/services/database_service.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  final _databaseService = DatabaseService();

 Future<bool> register(User user) async {
  try {
    // Проверка, существует ли пользователь
    final existingUser = await _databaseService.getUser(user.email);
    if (existingUser != null) {
      // Пользователь с таким email уже существует
      return false;
    }

    // Хэширование пароля (если используется)
    final hashedPassword = _hashPassword(user.password);

    // Сохранение нового пользователя
    await _databaseService.saveUser(user.copyWith(password: hashedPassword) as Map<String, dynamic>, user.email);
    return true; // Регистрация успешна
  } catch (e) {
    print('Ошибка при регистрации: $e');
    return false; // Возвращаем false в случае ошибки
  }
}

  Future<bool> loginUser(String username, String password) async {
    try {
      final user = await _databaseService.getUser(username);
      if (user == null) {
        print('Пользователь не найден');
        return false;
      }
      if (!_verifyPassword(password, user['passwordHash'])) {
        print('Неверный пароль');
        return false;
      }
      return true;
    } catch (e) {
      print('Ошибка при входе: $e');
      return false;
    }
  }

  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  bool _verifyPassword(String inputPassword, String storedHash) {
    return _hashPassword(inputPassword) == storedHash;
  }

  getCurrentUser() {}

  logout() {}

  login(String text, String text2) {}

  registerUser(User user) {}
}