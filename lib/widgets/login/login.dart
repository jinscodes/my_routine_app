import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';
import 'package:workout_app/common/title_text.dart';

class Login extends StatefulWidget {
  String token;
  Function setToken;

  Login({super.key, required this.token, required this.setToken});

  @override
  State<Login> createState() => _LoginState(token: token, setToken: setToken);
}

class _LoginState extends State<Login> {
  String token;
  Function setToken;

  _LoginState({required this.token, required this.setToken});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 57,
          vertical: 40,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(content: "LOGIN"),
              SizedBox(
                height: 42,
              ),
              InputString(),
              SizedBox(
                height: 15,
              ),
              InputString(),
            ],
          ),
        ),
      ),
    );
  }
}
