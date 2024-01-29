import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';
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
              const InputString(
                content: "id",
              ),
              const SizedBox(
                height: 15,
              ),
              const InputString(
                content: "pw",
              ),
              const SizedBox(
                height: 58,
              ),
              ButtonTheme(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                  onPressed: () {},
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "JejuHallasan",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
