import 'package:flutter/material.dart';

class SignupModel with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailValidController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwValidController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    emailValidController.dispose();
    pwController.dispose();
    pwValidController.dispose();
    super.dispose();
  }
}
