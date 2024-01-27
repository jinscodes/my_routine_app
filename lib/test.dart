import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 220,
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
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "©jay",
                        style: TextStyle(
                          fontFamily: "JejuHallasan",
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 80,
                      ),
                    ],
                  )
                ],
              ),
            ),
  }
}