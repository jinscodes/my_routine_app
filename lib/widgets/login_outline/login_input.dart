import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? type;

  const LoginInput({
    super.key,
    required this.controller,
    required this.title,
    this.type,
  });

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late TextEditingController controller;
  late String title;
  late String? type;
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
                  color: ColorTheme.gray,
                ),
              ),
              IconButton(
                onPressed: () => setState(
                  () => controller.clear(),
                ),
                icon: const Icon(
                  Icons.cancel_rounded,
                  color: ColorTheme.gray,
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
            color: ColorTheme.gray,
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
    return Container(
      width: 1.sw,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
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
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              type == "pw"
                  ? Icons.lock_outline_rounded
                  : Icons.person_outline_rounded,
              color: Colors.white,
              size: 30,
            ),
            suffixIcon: suffix(),
            hintText: title,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
