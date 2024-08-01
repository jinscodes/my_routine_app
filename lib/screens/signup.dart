import 'package:flutter/material.dart';
import 'package:workout_app/widgets/signup/step1_name.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return const Step1Name();
  }
}
