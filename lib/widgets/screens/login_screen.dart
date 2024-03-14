import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: CarouselSlider(
                  options: CarouselOptions(
                    // enlargeCenterPage: true,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        if (i == 1) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      "assets/images/bgDecoration.png",
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Create\nGood Habits",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          "Change your life by slowly adding new healty habits\nand sticking to them.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Image.asset(
                                          "assets/images/firstPage.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (i == 2) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      "assets/images/bgDecoration3.png",
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Track\nYour Progress",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          "Everyday you become one step closer to your goal. Don't give up!",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Image.asset(
                                          "assets/images/secondPage.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset(
                                      "assets/images/bgDecoration2.png",
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Stay Together\nand Strong",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          "Find friends to discuss common topics. Complete\nchallenges together.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Image.asset(
                                          "assets/images/thirdPage.png",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              60.0,
                            ),
                          ),
                          onPressed: () {
                            print("Continue with ID&PW");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Continue with ID&PW",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print("Apple");
                              },
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.apple_rounded,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Apple",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print("Google");
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/images/google.png"),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print("Kakao");
                              },
                              child: Row(
                                children: [
                                  Image.asset("assets/images/kakao.png"),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Kakao",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "By continuing you agree Terms of Services & Privacy Policy",
                          style: TextStyle(
                            color: ColorTheme.purple40,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
