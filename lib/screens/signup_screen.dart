import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/widgets/signup/complete_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isText = false;
  bool isError = false;
  bool isLoad = false;

  _signupValidation() async {
    try {
      _navigateToCompleteSignup(); // for dev
      // Map<String, dynamic> res = await PostApi(
      //   apiUrl: "/signup",
      //   body: {
      //     "userId": idController.text,
      //     "password": pwController.text,
      //     "nickname": nameController.text,
      //   },
      // ).postData();

      // if (res["userId"] != null) {
      //   _navigateToCompleteSignup();
      // } else {
      //   print("fail");
      // }
    } catch (e) {
      // ignore: avoid_print
      print("Err: $e");
    }
  }

  void _navigateToCompleteSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CompleteSignup(),
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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Create Account",
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
                          controller: nameController,
                          title: "NAME",
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
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
                          controller: pwController,
                          title: "PW",
                          isError: isError,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      NextButton(
                        content: "Next",
                        handlePressed: () {
                          _signupValidation();
                        },
                      ),
                    ],
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
