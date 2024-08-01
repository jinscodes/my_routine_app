import 'package:flutter/material.dart';

class SignupModel with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }
}
