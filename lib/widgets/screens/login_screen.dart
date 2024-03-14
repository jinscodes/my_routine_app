import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(),
                      items: [1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            if (i == 1) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                ),
                              );
                            } else if (i == 2) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                              );
                            } else {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                ),
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Flexible(
                //   flex: 3,
                //   child: Column(
                //     children: [
                //       Flexible(
                //         flex: 2,
                //         child: Container(
                //           alignment: Alignment.bottomCenter,
                //           child: Image.asset("assets/images/bgDecoration.png"),
                //         ),
                //       ),
                //       Flexible(
                //         flex: 1,
                //         child: Container(
                //           alignment: Alignment.centerLeft,
                //           child: const Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text(
                //                 "Create\nGood Habits",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 40,
                //                   fontWeight: FontWeight.w700,
                //                   height: 1.2,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 15,
                //               ),
                //               Text(
                //                 "Change your life by slowly adding new healty habits\nand sticking to them.",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
