import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/widgets/signup/signup_input.dart';
import 'package:workout_app/widgets/signup/step2_email.dart';

class Step1Name extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final String title;

  const Step1Name({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToNext() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Step2Email(
            emailController: emailController,
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsTheme.gray200,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 120.h, 25, 50.h),
            child: Column(
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
                          controller: nameController,
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
            ),
          ),
        ),
      ),
    );
  }
}
