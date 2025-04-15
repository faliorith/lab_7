import 'package:flutter/material.dart';
import 'package:flutter_lab_7/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Простой декоративный элемент
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.article_outlined,
                  size: 60,
                  color: Colors.purple.shade200,
                ),
              ),
              const SizedBox(height: 40),
              // Заголовок
              Text(
                'Добро пожаловать',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple.shade800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
              // Подзаголовок
              Text(
                'Ваше приложение для работы с постами',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple.shade400,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              // Кнопка входа
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    foregroundColor: Colors.purple.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Начать',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Дополнительная информация
              Text(
                'Нажмите кнопку выше, чтобы продолжить',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple.shade300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 