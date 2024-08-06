import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class SignupButton extends StatelessWidget {
  final FocusNode focusNode;
  final Function handlePressed;
  final String content;

  const SignupButton({
    super.key,
    required this.handlePressed,
    required this.content,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: focusNode.hasFocus ? 20.h : 70.h,
      ),
      child: ElevatedButton(
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
      ),
    );
  }
}
