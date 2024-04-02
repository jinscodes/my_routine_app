import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/next_button.dart';

class CompleteSignup extends StatefulWidget {
  const CompleteSignup({super.key});

  @override
  State<CompleteSignup> createState() => _CompleteSignupState();
}

class _CompleteSignupState extends State<CompleteSignup> {
  bool _isLoad = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoad = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoad
        ? Scaffold(
            body: Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: ColorTheme.mainBlue,
                size: 80,
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: ColorTheme.infoBlue,
                      size: 100,
                    ),
                    const Text("Thank you!"),
                    const Text("REGISTRATION COMPLETED!"),
                    NextButton(content: "Login", handlePressed: () {}),
                  ],
                ),
              ),
            ),
          );
  }
}
