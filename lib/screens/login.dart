import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/screens/home.dart';
import 'package:workout_app/widgets/login_outline/login_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool visible = false;
  String type = "";

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwController.dispose();
  }

  void _navigator() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Home(),
      ),
    );
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/appicon_white.png"),
                  const SizedBox(
                    height: 80,
                  ),
                  LoginInput(
                    controller: idController,
                    title: "Username",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  LoginInput(
                    controller: idController,
                    title: "Password",
                    type: "pw",
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
