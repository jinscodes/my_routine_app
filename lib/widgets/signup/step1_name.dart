import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/signupBg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 175.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "이름을 알려주세요",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 105.h,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "이름",
                      hintStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ColorsTheme.gray600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsTheme.gray600,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsTheme.point,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
