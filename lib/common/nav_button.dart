import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final Function handleClick;

  const NavButton({super.key, required this.title, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 60,
      child: ButtonTheme(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            foregroundColor: const Color(0x00cbcbcb),
            backgroundColor: const Color(0xFFD9D9D9),
          ),
          onPressed: () {
            handleClick();
          },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "JejuHallasan",
            ),
          ),
        ),
      ),
    );
  }
}
