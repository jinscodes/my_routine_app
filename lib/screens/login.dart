import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/widgets/appbar.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(
        content: "Continue with ID & PW",
      ),
      backgroundColor: ColorTheme.loginBgGray,
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Center(
            child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginInput(
                    controller: idController,
                    title: "Login",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginInput(
                    controller: pwController,
                    title: "Password",
                    type: "pw",
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
