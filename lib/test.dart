import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String token;
  final Function setToken;

  const Login({super.key, required this.token, required this.setToken});

  @override
  State<Login> createState() => _LoginState(token: token, setToken: setToken);
}

class _LoginState extends State<Login> {
  final String token;
  final Function setToken;

  _LoginState({required this.token, required this.setToken});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Test"),
      ),
    );
  }
}
