import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';
import 'package:workout_app/common/submit_button.dart';
import 'package:workout_app/common/title_text.dart';

class Login extends StatefulWidget {
  String token;
  Function setToken;

  Login({super.key, required this.token, required this.setToken});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String token = widget.token;
    Function setToken = widget.setToken;
    TextEditingController id = TextEditingController();
    TextEditingController pw = TextEditingController();

    login() {
      print("${id.text} & ${pw.text}");
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleText(content: "LOGIN"),
              const SizedBox(
                height: 42,
              ),
              InputString(
                content: "id",
                controller: id,
              ),
              const SizedBox(
                height: 15,
              ),
              InputString(
                content: "pw",
                controller: pw,
              ),
              const SizedBox(
                height: 58,
              ),
              SubmitButton(
                content: "Login",
                handleClick: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
