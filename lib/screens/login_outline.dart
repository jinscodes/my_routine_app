import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/widgets/login_outline/slide_content.dart';

class LoginOutline extends StatefulWidget {
  const LoginOutline({super.key});

  @override
  State<LoginOutline> createState() => _LoginOutlineState();
}

class _LoginOutlineState extends State<LoginOutline> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    slider(),
                    sliderIndicator(),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          print("login");
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Continue with ID/PW",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "By continuing you agree Terms of Services & Privacy Policy",
                        style: TextStyle(
                          fontSize: screenWidth * 0.028,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    double screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: const Duration(
            seconds: 3,
          ),
          viewportFraction: 1,
          height: screenHeight * 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: [1, 2, 3].map((i) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Builder(
            builder: (BuildContext context) {
              if (i == 1) {
                return const SlideContent(
                  content: "Create\nGood Habits",
                  ImagePath: "assets/images/bgDecoration.png",
                );
              } else if (i == 2) {
                return const SlideContent(
                  content: "Trace\nYour Progress",
                  ImagePath: "assets/images/bgDecoration2.png",
                );
              } else {
                return const SlideContent(
                  content: "Track\nYour Progress",
                  ImagePath: "assets/images/bgDecoration3.png",
                );
              }
            },
          ),
        );
      }).toList(),
    );
  }

  Widget sliderIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: _current == i ? ColorTheme.infoBlue : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
