import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final String content;
  final Function handleClick;

  const SubmitButton(
      {super.key, required this.content, required this.handleClick});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    String content = widget.content;
    Function handleClick = widget.handleClick;

    return ButtonTheme(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(60),
            backgroundColor: const Color(0xFFD9D9D9),
            foregroundColor: const Color(0xFFBABABA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        onPressed: () {
          handleClick();
        },
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: "JejuHallasan",
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
