import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/screens/login_outline.dart';

class SignupComplete extends StatefulWidget {
  const SignupComplete({super.key});

  @override
  State<SignupComplete> createState() => _SignupCompleteState();
}

class _SignupCompleteState extends State<SignupComplete> {
  bool count = false;

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginOutline(),
              ),
            )
        // () => setState(() {
        //   count = true;
        // }),
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
              if (count)
                ElevatedButton(
                  onPressed: () => print("button clicked"),
                  child: const Text("Button"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
