import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';

class LoginWithId extends StatefulWidget {
  const LoginWithId({super.key});

  @override
  State<LoginWithId> createState() => _LoginWithIdState();
}

class _LoginWithIdState extends State<LoginWithId> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isText = false;

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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
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
                            print("idC: ${idController.text}");
                            print("pwC: ${pwController.text}");
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
