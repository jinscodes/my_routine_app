import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_app/styles/font_inter.dart';

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
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: FontInter(
                              content: "workout",
                              isBold: true,
                              fontSize: 76,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 5,
                            ),
                            child: FontInter(
                              content: "Make your working out",
                              fontSize: 20,
                              color: Color(0xFF838383),
                              isBold: true,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF547CE3),
                          ),
                          child: const SizedBox(
                            width: 70,
                            height: 60,
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      'assets/svg/dumbell.svg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
