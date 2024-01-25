import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_app/common/nav_button.dart';
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

  loginClick() {
    print("login button clicked!");
  }

  signupClick() {
    print("signup button clicked!");
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (loginToken == "") {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  SvgPicture.asset(
                    'assets/svg/dumbell.svg',
                  ),
                  const Text(
                    "workout",
                    style: TextStyle(
                      fontFamily: "JejuHallasan",
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  NavButton(
                    title: "Login",
                    handleClick: loginClick,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  NavButton(
                    title: "Signup",
                    handleClick: signupClick,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("jay"),
                    ],
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
    );
  }
}
