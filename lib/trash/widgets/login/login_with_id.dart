// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/trash/common/login_text_field.dart';
import 'package:workout_app/trash/common/next_button.dart';
import 'package:workout_app/trash/utilities/api.dart';
import 'package:workout_app/trash/utilities/manageLoginToken.dart';
import 'package:workout_app/trash/utilities/navigate.dart';
import 'package:workout_app/trash/utilities/snackbar.dart';

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

  void loginValidation() async {
    try {
      String token = await PostApi(
        apiUrl: "/login",
        body: {
          "userId": idController.text,
          "password": pwController.text,
        },
      ).postData();

      await setLoginToken(token);

      NavigateTo(context: context).toHome();
    } catch (e) {
      // ignore: avoid_print
      print("Err: $e");

      Snackbar(
        type: SnackbarType.error,
        context: context,
        content: "Login failed 🥲",
      ).showSnackBar();
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
          onPressed: () => Navigator.of(context).pop(),
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
                          type: "",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          isError: isError,
                          controller: pwController,
                          title: "PW",
                          type: "password open",
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
                            NavigateTo(context: context).toSignup();
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
