import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class SignupTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode myFocusNode;
  final String title;
  final String? errorText;

  const SignupTextField({
    super.key,
    required this.controller,
    required this.myFocusNode,
    required this.title,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: myFocusNode,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 10,
          top: 5,
        ),
        hintText: myFocusNode.hasFocus ? "" : title,
        hintStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: ColorsTheme.gray600,
        ),
        errorText: errorText,
        errorStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorsTheme.red,
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
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorsTheme.red,
          ),
        ),
      ),
    );
  }
}
