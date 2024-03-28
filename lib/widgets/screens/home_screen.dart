import 'package:flutter/material.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';
import 'package:workout_app/widgets/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  logout() {
    removeLoginToken("login_token");

    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
