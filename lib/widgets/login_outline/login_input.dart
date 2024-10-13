import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? type;
  final String? errorText;

  const LoginInput({
    super.key,
    required this.controller,
    required this.title,
    this.type,
    this.errorText,
  });

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late TextEditingController controller;
  late String title;
  late String? type;
  late String? errorText;
  bool visible = true;

  suffix() {
    if (type == "pw") {
      if (controller.text.isNotEmpty) {
        return SizedBox(
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => setState(() => visible = !visible),
                icon: Icon(
                  visible ? Icons.visibility_off : Icons.visibility,
                  color: ColorsTheme.gray300,
                ),
              ),
              IconButton(
                onPressed: () => setState(
                  () => controller.clear(),
                ),
                icon: const Icon(
                  Icons.cancel_rounded,
                  color: ColorsTheme.gray300,
                ),
              ),
            ],
          ),
        );
      } else {
        return null;
      }
    } else {
      if (controller.text.isNotEmpty) {
        return IconButton(
          onPressed: () => setState(
            () => controller.clear(),
          ),
          icon: const Icon(
            Icons.cancel_rounded,
            color: ColorsTheme.gray300,
          ),
        );
      } else {
        return null;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    title = widget.title;
    type = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: controller,
        onChanged: (value) => setState(() => controller.text),
        obscureText: type == "pw" ? visible : !visible,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 6,
            ),
            child: Icon(
              type == "pw"
                  ? Icons.lock_outline_rounded
                  : type == "username"
                      ? Icons.person_outline_rounded
                      : Icons.email_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          suffixIcon: suffix(),
          errorText: widget.errorText,
          errorStyle: TextStyle(
            fontSize: 14.sp,
            color: ColorsTheme.red,
          ),
          hintText: title,
          hintStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
