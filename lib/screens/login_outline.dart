import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';

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
                  children: [
                    SizedBox(
                      height: screenHeight / 1.3,
                      child: slider(),
                    ),
                    sliderIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    double screenWidth = MediaQuery.of(context).size.width;
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
          height: screenHeight,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });

            print(_current);
          }),
      items: [1, 2, 3].map((i) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Builder(
            builder: (BuildContext context) {
              if (i == 1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/images/bgDecoration.png"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create\nGood Habits",
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (i == 2) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/images/bgDecoration3.png"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Track\nYour Progress",
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/images/bgDecoration2.png"),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Track\nYour Progress",
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
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
              height: 12,
              width: 12,
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
