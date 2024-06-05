import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';
import 'package:workout_app/utilities/navigate.dart';

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
      const Duration(seconds: 2),
      () {
        NavigateTo(
          context: context,
          type: NavigateType.pushRep,
        ).toHome();
      },
    );
  }

  _navigateToLogin() {
    Timer(
      const Duration(seconds: 2),
      () {
        NavigateTo(
          context: context,
        ).toLogin();
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
