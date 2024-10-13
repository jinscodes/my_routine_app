import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/screens/home.dart';
import 'package:workout_app/utilities/login/login_validation.dart';
import 'package:workout_app/widgets/login_outline/login_button.dart';
import 'package:workout_app/widgets/login_outline/login_input.dart';
import 'package:workout_app/widgets/signup/SignupFlow.dart';

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
  String? isValid;

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwController.dispose();
  }

  void _validateIdAndPw() async {
    dynamic result = await loginValidation(
      idController.text,
      pwController.text,
    );

    if (result["isSuccess"]) {
      _navigateToHome();
    } else {
      _setErrorMessage("아이디 또는 비밀번호가 일치하지 않습니다");
    }
  }

  void _setErrorMessage(String message) {
    setState(() {
      isValid = message;
    });
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SignupFlow(),
      ),
    );
  }

  void _navigateToHome() {
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
              horizontal: 25,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/appicon.png"),
                  SizedBox(
                    height: 60.h,
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
                    errorText: isValid,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  LoginButton(
                    title: "LOGIN",
                    handleClick: () => _validateIdAndPw(),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: ColorsTheme.gray400,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextButton(
                        onPressed: () => _navigateToSignup(),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
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
