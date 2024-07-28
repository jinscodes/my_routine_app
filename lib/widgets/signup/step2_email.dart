import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/widgets/signup/signup_input.dart';
import 'package:workout_app/widgets/signup/step3_password.dart';

class Step2Email extends StatefulWidget {
  final TextEditingController emailController;

  const Step2Email({
    super.key,
    required this.emailController,
  });

  @override
  State<Step2Email> createState() => _Step2EmailState();
}

class _Step2EmailState extends State<Step2Email> {
  final TextEditingController emailCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void navigateToNext() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Step3Password(),
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
                          "Email",
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
                          controller: widget.emailController,
                          title: "Email",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 246.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                ),
                                child: TextField(
                                  controller: emailCodeController,
                                  onChanged: (value) =>
                                      setState(() => emailCodeController.text),
                                  style: const TextStyle(
                                    color: ColorsTheme.gray500,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  cursorColor: ColorsTheme.gray500,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: ColorsTheme.gray500,
                                      size: 30,
                                    ),
                                    // suffixIcon: suffix(),
                                    hintText: "XXX-XXX",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsTheme.gray500,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsTheme.point,
                                minimumSize: Size(120.w, 60.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "인증하기",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsTheme.white,
                                ),
                              ),
                            ),
                          ],
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
