import 'dart:async';

import 'package:flutter/material.dart';

import '../trash/utilities/manageLoginToken.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _checkLoginToken() async {
    String? loginToken = await getLoginToken();

    if (loginToken == null || loginToken.isEmpty) {
    } else {}
  }

  void throughTimer(Function navigate) {
    Timer(
      const Duration(seconds: 2),
      () => navigate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
