import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/utilities/login/login_validation.dart';
import 'package:workout_app/widgets/login_outline/login_button.dart';
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

  void _navigateToHome() async {
    dynamic result = loginValidation(
      idController.text,
      pwController.text,
    );

    print(result);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const Home(),
    //   ),
    // );
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
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print("Forgot Password");
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  LoginButton(
                    title: "LOGIN",
                    handleClick: () => _navigateToHome(),
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
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextButton(
                        onPressed: () {
                          print("Click Signup");
                        },
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
