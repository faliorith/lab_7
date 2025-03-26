import 'package:flutter/material.dart';
import 'package:flutter_lab_7/post/pages/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Post Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostPage()
    );
  }
}
 