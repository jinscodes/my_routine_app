import 'package:flutter/material.dart';

class LoginOutline extends StatelessWidget {
  const LoginOutline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
