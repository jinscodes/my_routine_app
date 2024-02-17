import 'package:flutter/material.dart';
import 'package:workout_app/replacement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController test = TextEditingController();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
          // background: const Color(0xFFC5C5C5),
          background: Colors.white,
        ),
      ),
      home: const Auth(),
      // home: const Home(),
      // home: const Test(),
    );
  }
}
