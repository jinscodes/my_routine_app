import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LoginOutline extends StatelessWidget {
  const LoginOutline({super.key});

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
                child: Container(
                  color: Colors.yellow,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height,
                    ),
                    items: [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          if (i == 1) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ));
                          } else if (i == 2) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                              ),
                              child: Text(
                                'text $i',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            );
                          } else {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                              ),
                              child: Text(
                                'text $i',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              // Flexible(
              //   flex: 3,
              //   child: CarouselSlider(
              //     options: CarouselOptions(
              //       enableInfiniteScroll: true,
              //       autoPlay: true,
              //       viewportFraction: 1,
              //       height: 200,
              //     ),
              //     items: [1, 2, 3].map((i) {
              //       return Builder(
              //         builder: (BuildContext context) {
              //           if (i == 1) {
              //             return Container(
              //                 width: MediaQuery.of(context).size.width,
              //                 height: 200,
              //                 margin:
              //                     const EdgeInsets.symmetric(horizontal: 5.0),
              //                 decoration: const BoxDecoration(
              //                   color: Colors.red,
              //                 ),
              //                 child: Text(
              //                   'text $i',
              //                   style: const TextStyle(fontSize: 16.0),
              //                 ));
              //           } else if (i == 2) {
              //             return Container(
              //               width: MediaQuery.of(context).size.width,
              //               height: 200,
              //               margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //               decoration: const BoxDecoration(
              //                 color: Colors.orange,
              //               ),
              //               child: Text(
              //                 'text $i',
              //                 style: const TextStyle(fontSize: 16.0),
              //               ),
              //             );
              //           } else {
              //             return Container(
              //               width: MediaQuery.of(context).size.width,
              //               height: 200,
              //               margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //               decoration: const BoxDecoration(
              //                 color: Colors.yellow,
              //               ),
              //               child: Text(
              //                 'text $i',
              //                 style: const TextStyle(fontSize: 16.0),
              //               ),
              //             );
              //           }
              //         },
              //       );
              //     }).toList(),
              //   ),
              // ),
              // Flexible(
              //   flex: 1,
              //   child: Container(
              //     color: Colors.green,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
