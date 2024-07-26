import 'package:flutter/material.dart';
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
              removeLoginToken("token");
              print("remove token");
            },
            child: const Text("Logout"),
          ),
        ),
      ),
    );
  }
}
