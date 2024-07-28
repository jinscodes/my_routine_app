import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class SignupInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? type;

  const SignupInput({
    super.key,
    required this.controller,
    required this.title,
    this.type,
  });

  @override
  State<SignupInput> createState() => _SignupInputState();
}

class _SignupInputState extends State<SignupInput> {
  late TextEditingController controller;
  late String title;
  late String? type;
  bool visible = true;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    title = widget.title;
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: TextField(
          controller: controller,
          onChanged: (value) => setState(() => controller.text),
          obscureText: type == "pw" ? visible : !visible,
          style: const TextStyle(
            color: ColorsTheme.gray500,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          cursorColor: ColorsTheme.gray500,
          decoration: InputDecoration(
            prefixIcon: Icon(
              type == "pw"
                  ? Icons.lock_outline_rounded
                  : type == "username"
                      ? Icons.person_outline_rounded
                      : Icons.email_outlined,
              color: ColorsTheme.gray500,
              size: 30,
            ),
            // suffixIcon: suffix(),
            hintText: title,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsTheme.gray500,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
