import 'package:flutter/material.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';

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
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Row(
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text("Calendar"),
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.centerRight,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
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
