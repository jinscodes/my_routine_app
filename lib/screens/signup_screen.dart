// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/utilities/api.dart';
import 'package:workout_app/utilities/navigate.dart';
import 'package:workout_app/utilities/snackbar.dart';

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
  bool isIdDoubleChecked = false;

  _signupValidation() async {
    try {
      Map<String, dynamic> res = await PostApi(
        apiUrl: "/signup",
        body: {
          "userId": idController.text,
          "password": pwController.text,
          "nickname": nameController.text,
        },
      ).postData();

      if (res["userId"] != null) {
        NavigateTo(
          context: context,
          type: NavigateType.complete,
        ).toLogin();
      } else {
        // will do
        print("fail");
      }
    } catch (e) {
      print("Err_signup: $e");

      return Snackbar(
        type: SnackbarType.error,
        context: context,
        content: "Signup failed 🥲",
      ).showSnackBar();
    }
  }

  void idDoubleCheck() async {
    try {
      Response res =
          await GetApi(apiUrl: "/id/exists/${idController.text}").getData();

      if (res.data["isAvailable"] == true) {
        setState(() {
          isIdDoubleChecked = true;
        });
      }
    } catch (e) {
      print("Err_signup: $e");

      return Snackbar(
        type: SnackbarType.error,
        context: context,
        content: "This id already exists 🥲",
      ).showSnackBar();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
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
                          type: "",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                              child: LoginTextField(
                                controller: idController,
                                title: "ID",
                                isError: isError,
                                type: "id doublecheck",
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  isIdDoubleChecked
                                      ? const Icon(
                                          Icons.check_circle_outline_outlined,
                                        )
                                      : const Icon(
                                          Icons.cancel_outlined,
                                        ),
                                  SizedBox(
                                    width: 70,
                                    child: TextButton(
                                      onPressed: () {
                                        idDoubleCheck();
                                      },
                                      child: const Text("Check"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          controller: pwController,
                          title: "PW",
                          isError: isError,
                          type: "password open",
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
                          idDoubleCheck();
                          // _signupValidation();
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
