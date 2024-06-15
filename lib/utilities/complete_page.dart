import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/next_button.dart';

class CompletePage extends StatefulWidget {
  final Function navigator;
  final bool? isTwoButton;

  const CompletePage({
    super.key,
    required this.navigator,
    this.isTwoButton,
  });

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
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
  void dispose() {
    super.dispose();
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
        : PopScope(
            canPop: false,
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                color: ColorTheme.infoBlue,
                                size: 100,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Thank you!",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                  color: ColorTheme.infoBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "REGISTRATION COMPLETED!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: NextButton(
                            content: "Next",
                            handlePressed: () => widget.navigator(),
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
