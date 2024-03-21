import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class LoginTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const LoginTextField(
      {super.key, required this.controller, required this.title});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late TextEditingController controller;
  late String title;
  bool isText = false;

  void handleChange(String word) {
    if (word.isNotEmpty) {
      setState(() {
        isText = true;
      });
    } else {
      setState(() {
        isText = false;
      });
    }
  }

  void resetText(TextEditingController controller) {
    controller.clear();
    setState(() {
      isText = false;
    });
  }

  @override
  void initState() {
    controller = widget.controller;
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          onChanged: (value) {
            handleChange(value);
          },
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            suffixIcon: controller.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () {
                      resetText(controller);
                    },
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: ColorTheme.gray,
                    ),
                  ),
            hintText: "Enter your ${title.toLowerCase()}",
            hintStyle: const TextStyle(
              color: ColorTheme.gray,
              fontSize: 20,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.gray.withOpacity(0.6),
                width: 3,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.green.withOpacity(0.5),
                width: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
