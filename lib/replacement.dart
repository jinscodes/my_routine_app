import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 5,
            ),
          ),
          child: const SizedBox.expand(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text("data1"),
                Text("data2"),
                Text("data3"),
                Text("data4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
