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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              child: SizedBox(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        const Column(
                          children: [
                            FontInter(
                              content: "workout",
                              fontSize: 80,
                              isBold: true,
                            ),
                            FontInter(
                              content: "Make your working out",
                              fontSize: 20,
                              color: Color(0xFF838383),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: const SizedBox(
                            width: 70,
                            height: 60,
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      child: SvgPicture.asset(
                        'assets/svg/dumbell.svg',
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
