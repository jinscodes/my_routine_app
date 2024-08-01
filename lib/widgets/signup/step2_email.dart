import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';

class Step2Email extends StatefulWidget {
  const Step2Email({
    super.key,
  });

  @override
  State<Step2Email> createState() => _Step2EmailState();
}

class _Step2EmailState extends State<Step2Email> {
  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<SignupModel>(context).emailController;

    print("step2: ${emailController.text}");

    return const Scaffold();
  }
}
