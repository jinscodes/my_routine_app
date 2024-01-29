// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class InputString extends StatefulWidget {
  final String content;

  const InputString({super.key, required this.content});

  @override
  State<InputString> createState() => _InputStringState();
}

class _InputStringState extends State<InputString> {
  @override
  Widget build(BuildContext context) {
    String content = widget.content;
    String contentUppercase = widget.content.toUpperCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "JejuHallasan",
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFFD9D9D9),
          ),
          child: Form(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter $contentUppercase",
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
