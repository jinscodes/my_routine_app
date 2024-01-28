import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_app/home/home.dart';
import 'package:workout_app/widgets/login/login.dart';
import 'package:workout_app/widgets/signup/signup.dart';

import 'common/nav_button.dart';

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
            builder: (context) =>
                Login(token: loginToken, setToken: setToken)));
  }

  signupClick() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
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
                        const Text(
                          "workout",
                          style: TextStyle(
                            fontFamily: "JejuHallasan",
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(
                          height: 60.0,
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
                  Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const Text("1"),
                      const Text("2"),
                      const Text("3"),
                    ],
                  )
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       "©jay",
                  //       style: TextStyle(
                  //         fontFamily: "JejuHallasan",
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 40,
                  //       height: 80,
                  //     ),
                  //   ],
                  // ),
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
