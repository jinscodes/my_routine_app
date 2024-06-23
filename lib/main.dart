import 'package:flutter/material.dart';
import 'package:workout_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFF5F8FF),
        ),
      ),
      home: const Splash(),
    );
  }
}
