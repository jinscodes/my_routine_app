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
  bool visible = false;

  suffix() {
    if (type == "pw") {
      if (controller.text.isNotEmpty) {
        return Row(
          children: [
            IconButton(
              onPressed: () => setState(() => visible = true),
              icon: const Icon(
                Icons.visibility,
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
        );
      } else {
        return null;
      }
    } else {
      if (controller.text.isNotEmpty) {
        return IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cancel_rounded,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          onChanged: (value) => setState(() => controller.text),
          obscureText: visible,
          decoration: InputDecoration(
            hintText: "Enter your ID",
            hintStyle: TextStyle(
              fontSize: 20.sp,
              color: ColorTheme.gray,
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () => setState(() => controller.clear()),
                    icon: const Icon(
                      Icons.cancel_rounded,
                      color: ColorTheme.gray,
                    ),
                  )
                : null,
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
