import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/utilities/api.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';
import 'package:workout_app/widgets/screens/home_screen.dart';

class LoginWithId extends StatefulWidget {
  const LoginWithId({super.key});

  @override
  State<LoginWithId> createState() => _LoginWithIdState();
}

class _LoginWithIdState extends State<LoginWithId> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String token = "";
  bool isText = false;
  bool isError = false;

  void handleChange(String word) {
    if (word.isNotEmpty) {
      setState(() {
        isText = true;
      });
    } else {
      setState(() {
        isText = false;
      });
    }
  }

  void resetText(TextEditingController controller) {
    controller.clear();
    setState(() {
      isText = false;
    });
  }

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
      print("Err: $e");

      return showSnackBar(context, "Login failed 🥲");
    }
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
          style: IconButton.styleFrom(),
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
          color: Color.fromARGB(255, 230, 232, 237),
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
                      children: [
                        TextButton(
                          onPressed: () {
                            print("Navigate to SIGN UP page");
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
