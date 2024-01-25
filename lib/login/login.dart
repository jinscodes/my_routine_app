import 'package:flutter/material.dart';

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
      body: Center(
        child: Text("login"),
      ),
    );
  }
}
