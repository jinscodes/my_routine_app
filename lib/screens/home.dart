import 'package:flutter/material.dart';
import 'package:workout_app/screens/login_outline.dart';
import 'package:workout_app/utilities/manage_login_token.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              print("remove token");
              removeLoginToken();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginOutline(),
                ),
              );
            },
            child: const Text("Logout"),
          ),
        ),
      ),
    );
  }
}
