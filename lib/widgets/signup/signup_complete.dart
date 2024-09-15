import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/screens/login_outline.dart';

class SignupComplete extends StatefulWidget {
  const SignupComplete({super.key});

  @override
  State<SignupComplete> createState() => _SignupCompleteState();
}

class _SignupCompleteState extends State<SignupComplete> {
  bool onButton = false;

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => setState(() {
        onButton = true;
      }),
    );
  }

  void _navigateToNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginOutline(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/check.png"),
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        "회원가입이\n완료되었습니다",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onButton)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 70.h,
                    ),
                    child: ElevatedButton(
                      onPressed: () => _navigateToNext(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(1.sw, 60.h),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          color: ColorsTheme.point,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
