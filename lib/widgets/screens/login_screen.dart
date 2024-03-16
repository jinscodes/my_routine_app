import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/widgets/login/bgDecoration.dart';
import 'package:workout_app/widgets/login/loginButton.dart';

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
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        if (i == 1) {
                          return const BgDecoration(
                            imgRoute: "assets/images/bgDecoration.png",
                            content: [
                              "Create\nGood Habits",
                              "Change your life by slowly adding new healty habits\nand sticking to them."
                            ],
                            stepImgRoute: "assets/images/firstPage.png",
                          );
                        } else if (i == 2) {
                          return const BgDecoration(
                            imgRoute: "assets/images/bgDecoration3.png",
                            content: [
                              "Track\nYour Progress",
                              "Everyday you become one step closer to your goal. Don't give up!"
                            ],
                            stepImgRoute: "assets/images/secondPage.png",
                          );
                        } else {
                          return const BgDecoration(
                            imgRoute: "assets/images/bgDecoration2.png",
                            content: [
                              "Stay Together\nand Strong",
                              "Find friends to discuss common topics. Complete\nchallenges together."
                            ],
                            stepImgRoute: "assets/images/thirdPage.png",
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
                        LoginButton(
                          isSocialLogin: false,
                          content: "Continue with ID&PW",
                          isIcon: true,
                          icon: const Icon(
                            Icons.login_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            print("ID&PW");
                          },
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     minimumSize: Size(
                        //       MediaQuery.of(context).size.width,
                        //       60.0,
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     print("Continue with ID&PW");
                        //   },
                        //   child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.login_rounded,
                        //         color: Colors.black,
                        //       ),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text(
                        //         "Continue with ID&PW",
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LoginButton(
                              isSocialLogin: true,
                              content: "Apple",
                              isIcon: true,
                              icon: const Icon(
                                Icons.apple_rounded,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                print("apple");
                              },
                            ),
                            LoginButton(
                              isSocialLogin: true,
                              content: "Google",
                              isIcon: false,
                              imgPath: "assets/images/google.png",
                              onPressed: () {
                                print("google");
                              },
                            ),
                            LoginButton(
                              isSocialLogin: true,
                              content: "Kakao",
                              isIcon: false,
                              imgPath: "assets/images/kakao.png",
                              onPressed: () {
                                print("kakao");
                              },
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
