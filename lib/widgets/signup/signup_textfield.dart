import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class SignupTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;

  const SignupTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 10,
          top: 5,
        ),
        hintText: focusNode.hasFocus ? "" : "이름",
        hintStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: ColorsTheme.gray600,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorsTheme.gray600,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorsTheme.point,
          ),
        ),
      ),
    );
  }
}
