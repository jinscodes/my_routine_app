import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';

enum SnackbarType { error, warning }

class Snackbar {
  SnackbarType? type;
  BuildContext context;
  String content;

  Snackbar({
    this.type,
    required this.context,
    required this.content,
  });

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            type == SnackbarType.error ? ColorTheme.pink : ColorTheme.darkBlue,
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
