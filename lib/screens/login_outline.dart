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
                  child: Column(
                    children: [
                      SizedBox(
                        child: slider(),
                      ),
                      // sliderIndicator(),
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
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(
            seconds: 3,
          ),
          viewportFraction: 1,
          height: MediaQuery.of(context).size.height,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });

            print(_current);
          }),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            if (i == 1) {
              return Image.asset("assets/images/bgDecoration.png");
            } else if (i == 2) {
              return Image.asset("assets/images/bgDecoration3.png");
            } else {
              return Image.asset("assets/images/bgDecoration2.png");
            }
          },
        );
      }).toList(),
    );
  }

  Widget sliderIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
