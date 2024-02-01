import 'package:flutter/material.dart';
import 'package:workout_app/common/title_text.dart';
import 'package:workout_app/widgets/signup/idAndPw.dart';

class Signup extends StatefulWidget {
  final int step = 0;

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 40,
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(content: "SIGNUP"),
                  const SizedBox(
                    height: 42,
                  ),
                  Builder(
                    builder: (context) {
                      if (widget.step == 0) {
                        return const IdAndPw();
                      } else {
                        return const Text("username");
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
