import 'package:flutter/material.dart';
import 'package:workout_app/home/home.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late String loginToken = "";

  setToken(token) {
    setState(() {
      loginToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (loginToken == "") {
              return const Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                      ),
                      Text(
                        "workout",
                        style: TextStyle(
                          fontFamily: "JejuHallasan",
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              );
              // return Login(
              //   token: loginToken,
              //   setToken: setToken,
              // );
            } else {
              return const Home();
            }
          },
        ),
      ),
    );
  }
}
