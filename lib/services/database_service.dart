import 'package:hive/hive.dart';

class DatabaseService {
  late Box _box;

  // Инициализация Hive и открытие бокса
  Future<void> init() async {
    _box = await Hive.openBox('users');
  }

  // Сохранение пользователя
  Future<void> saveUser(Map<String, dynamic> user, String email) async {
    await _box.put(user['email'], user); // Используем email как ключ
  }

  // Получение пользователя по email
  Map<String, dynamic>? getUser(String email) {
    final user = _box.get(email);
    return user != null ? Map<String, dynamic>.from(user) : null;
  }

  // Удаление всех пользователей
  Future<void> clearUsers() async {
    await _box.clear();
  }

  // Получение всех пользователей
  List<Map<String, dynamic>> getAllUsers() {
    return _box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}