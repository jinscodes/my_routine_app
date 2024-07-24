import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/screens/home.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/utilities/login/login_validation.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/appicon_white.png"),
                  const SizedBox(
                    height: 80,
                  ),
                  LoginInput(
                    controller: idController,
                    title: "Email",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  LoginInput(
                    controller: pwController,
                    title: "Password",
                    type: "pw",
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginValidation(
                        context,
                        idController.text,
                        pwController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.sw, 55.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorTheme.mainBlue,
                      ),
                    ),
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
