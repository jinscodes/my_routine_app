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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            "id",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "JejuHallasan",
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Form(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter an ID",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
