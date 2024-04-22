import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class Snackbar {
  BuildContext context;
  String content;

  Snackbar({
    required this.context,
    required this.content,
  });

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorTheme.errorRed,
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }
}
