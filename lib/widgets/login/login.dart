import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    login() async {
      if (id.text != "" && pw.text != "") {
        try {
          Dio dio = Dio();

          Response res = await dio.post(
            "path",
            data: {
              "userId": id.text,
              "password": pw.text,
            },
          );
        } catch (e) {
          showSnackBar(context, "Login failed 🥲");
        }
      }
    }

    return const Placeholder();
  }
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
