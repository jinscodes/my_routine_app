import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/screens/home_screen.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkLoginToken() async {
    String? loginToken = await getLoginToken();

    if (loginToken == null || loginToken.isEmpty) {
      return _navigateToLogin();
    } else {
      return _navigateToHome();
    }
  }

  _navigateToHome() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<ExerciseProvider>(
              create: (_) => ExerciseProvider(),
              child: const HomeScreen(),
            ),
          ),
        );
      },
    );
  }

  _navigateToLogin() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _checkLoginToken();
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splashScreen.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
