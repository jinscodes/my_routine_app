import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

// ignore: must_be_immutable
class LabelText extends StatelessWidget {
  final String title;
  final FocusNode focusNode;
  late TextEditingController controller;

  LabelText({
    super.key,
    required this.title,
    required this.focusNode,
    required this.controller,
  });

  Widget label() {
    if (focusNode.hasFocus) {
      return Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: ColorsTheme.point,
        ),
      );
    } else if (!focusNode.hasFocus && controller.text.isNotEmpty) {
      return Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: ColorsTheme.gray600,
        ),
      );
    } else {
      return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Align(
        alignment: Alignment.centerLeft,
        child: label(),
      ),
    );
  }
}
