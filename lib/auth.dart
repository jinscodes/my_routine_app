import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_app/styles/font_jejuHallasan.dart';
import 'package:workout_app/widgets/login/home/home.dart';
import 'package:workout_app/widgets/login/login.dart';
import 'package:workout_app/widgets/signup/signup.dart';

import 'common/nav_button.dart';
import 'common/title_text.dart';

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
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(token: loginToken, setToken: setToken),
      ),
    );
  }

  signupClick() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
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
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/dumbell.svg',
                        ),
                        const TitleText(content: "WORKOUT"),
                        const SizedBox(
                          height: 80.0,
                        ),
                        NavButton(
                          title: "Login",
                          handleClick: loginClick,
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                        NavButton(
                          title: "Signup",
                          handleClick: signupClick,
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 15.0,
                        ),
                        child: FontJejuHallasan(
                          content: "©jay",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Home();
        }
      },
    );
  }
}
