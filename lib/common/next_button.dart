import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class NextButton extends StatelessWidget {
  final String content;
  final Function handlePressed;

  const NextButton({
    super.key,
    required this.content,
    required this.handlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width,
          60,
        ),
        backgroundColor: ColorTheme.mainBlue,
      ),
      onPressed: () {
        handlePressed();
      },
      child: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
