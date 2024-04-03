import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/screens/home_screen.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/screens/signup_screen.dart';
import 'package:workout_app/utilities/api.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';

class LoginWithId extends StatefulWidget {
  const LoginWithId({super.key});

  @override
  State<LoginWithId> createState() => _LoginWithIdState();
}

class _LoginWithIdState extends State<LoginWithId> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isText = false;
  bool isError = false;

  loginValidation() async {
    try {
      String token = await PostApi(
        apiUrl: "/login",
        body: {
          "userId": idController.text,
          "password": pwController.text,
        },
      ).postData();

      await setLoginToken(token);

      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print("Err: $e");

      return showSnackBar(context, "Login failed 🥲");
    }
  }

  _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _navigateToLogin(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Continue with ID & PW",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorTheme.loginBgGray,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        LoginTextField(
                          controller: idController,
                          title: "ID",
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          isError: isError,
                          controller: pwController,
                          title: "PW",
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            _navigateToSignup();
                          },
                          child: const Text(
                            "Don't have account? Let's create!",
                            style: TextStyle(
                              color: ColorTheme.mainBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        NextButton(
                          content: "Next",
                          handlePressed: () {
                            loginValidation();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorTheme.errorRed,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
