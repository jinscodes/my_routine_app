import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/step1_name.dart';

class SignupFlow extends StatelessWidget {
  const SignupFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Step1Name(),
      ),
    );
  }
}

void main() {
  runApp(
    const SignupFlow(),
  );
}
