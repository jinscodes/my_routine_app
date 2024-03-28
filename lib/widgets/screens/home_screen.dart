import 'package:flutter/material.dart';
import 'package:workout_app/models/manageLoginToken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                removeLoginToken("loginToken");
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
