import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app/screens/home.dart';
import 'package:workout_app/screens/login_outline.dart';
import 'package:workout_app/utilities/manage_login_token.dart';

void checkLoginToken(BuildContext context) async {
  String? loginToken = await getLoginToken();

  if (loginToken == null || loginToken.isEmpty) {
    _throughTimer(
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginOutline(),
        ),
      ),
    );
  } else {
    _throughTimer(
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Home(),
        ),
      ),
    );
  }
}

void _throughTimer(Function navigate) {
  Timer(
    const Duration(seconds: 2),
    () => navigate(),
  );
}
