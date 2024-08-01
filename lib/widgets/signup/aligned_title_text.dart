import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlignedTitleText extends StatelessWidget {
  final String title;

  const AlignedTitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
