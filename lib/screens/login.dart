import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/widgets/appbar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(
        content: "Continue with ID & PW",
      ),
      backgroundColor: ColorTheme.loginBgGray,
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Center(
            child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                    // color: Colors.green,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your ID",
                        hintStyle: TextStyle(
                          fontSize: 20.sp,
                          color: ColorTheme.gray,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorTheme.gray.withOpacity(0.6),
                            width: 3,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorTheme.green.withOpacity(0.5),
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
