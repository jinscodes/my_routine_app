import 'package:flutter/material.dart';
import 'package:workout_app/widgets/signup/step1_name.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Step1Name(
      nameController: nameController,
      emailController: emailController,
      title: "Fullname",
    );
  }
}
