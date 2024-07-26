import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function handleClick;

  const LoginButton({
    super.key,
    required this.title,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleClick(),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(1.sw, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.mainBlue,
        ),
      ),
    );
  }
}
