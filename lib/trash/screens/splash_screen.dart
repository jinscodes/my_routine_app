import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app/trash/utilities/manageLoginToken.dart';
import 'package:workout_app/trash/utilities/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkLoginToken() async {
    String? loginToken = await getLoginToken();

    if (loginToken == null || loginToken.isEmpty) {
      return throughTimer(
        () => NavigateTo(context: context).toLogin(),
      );
    } else {
      return throughTimer(
        () => NavigateTo(context: context).toHome(),
      );
    }
  }

  void throughTimer(Function navigate) {
    Timer(
      const Duration(seconds: 2),
      () => navigate(),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkLoginToken();
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
