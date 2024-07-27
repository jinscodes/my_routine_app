import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/widgets/signup/signup_input.dart';
import 'package:workout_app/widgets/signup/step2_email.dart';

class Step1Name extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const Step1Name({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToNext() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Step2Email(),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create\nAccount",
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fullname",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.gray600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SignupInput(
                  controller: controller,
                  title: "Username",
                ),
              ],
            )
          ],
        ),
        ElevatedButton(
          onPressed: () => navigateToNext(),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(1.sw, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: ColorsTheme.black,
            ),
          ),
        ),
      ],
    );
  }
}
