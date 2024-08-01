import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class SignupButton extends StatelessWidget {
  final Function handlePressed;
  final String content;

  const SignupButton({
    super.key,
    required this.handlePressed,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handlePressed(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(1.sw, 60.h),
        backgroundColor: ColorsTheme.point,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: ColorsTheme.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
