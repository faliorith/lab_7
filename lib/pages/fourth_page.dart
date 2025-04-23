import 'package:flutter/material.dart';
import 'package:flutter_lab_7/models/user.dart'; 

class FourthPage extends StatelessWidget {
  final User? currentUser; 

  const FourthPage({super.key, this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: const Color(0xFF4B0082),
      ),
      body: currentUser != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard('Имя', '${currentUser!.name} ${currentUser!.surname}'),
                  _buildInfoCard('Email', currentUser!.email),
                  _buildInfoCard('Телефон', currentUser!.phone),
                  _buildInfoCard('Адрес', currentUser!.address),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF4B0082),
              ),
            ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(
                Icons.info,
                color: Color(0xFF4B0082),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B0082),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
