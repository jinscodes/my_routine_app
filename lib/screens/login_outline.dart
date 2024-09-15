import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/widgets/login_outline/login_outline_button.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    children: [
                      const LoginOutlineButton(
                        type: "login",
                        content: "Continue with ID/PW",
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const LoginOutlineButton(
                        type: "signup",
                        content: "Signup with ID/PW",
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "By continuing you agree Terms of Services & Privacy Policy",
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          color: ColorsTheme.pointLight1,
                        ),
                      ),
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
          height: 650.h,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: [1, 2, 3].map((i) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          child: Builder(
            builder: (BuildContext context) {
              if (i == 1) {
                return const SlideContent(
                  content: "Create\nGood Habits",
                  imagePath: "assets/images/bgDecoration.png",
                );
              } else if (i == 2) {
                return const SlideContent(
                  content: "Trace\nYour Progress",
                  imagePath: "assets/images/bgDecoration2.png",
                );
              } else {
                return const SlideContent(
                  content: "Track\nYour Progress",
                  imagePath: "assets/images/bgDecoration3.png",
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
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
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
                color: _current == i ? ColorsTheme.pointLight2 : Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
