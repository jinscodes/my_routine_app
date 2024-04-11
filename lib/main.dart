import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/screens/test.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFF5F8FF),
        ),
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (_) => Counter(),
        child: const TestScreen(),
      ),
      // home: const SplashScreen(),
    );
  }
}
