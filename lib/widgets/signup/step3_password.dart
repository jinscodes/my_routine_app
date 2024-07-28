import 'package:flutter/material.dart';
import 'package:workout_app/colors.dart';

class Step3Password extends StatelessWidget {
  const Step3Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsTheme.gray200,
        ),
        child: const Center(
          child: Text("3"),
        ),
      ),
    );
  }
}
