import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/screens/login.dart';
import 'package:workout_app/widgets/signup/SignupFlow.dart';

class LoginOutlineButton extends StatelessWidget {
  final String type;
  final String content;

  const LoginOutlineButton(
      {super.key, required this.type, required this.content});

  @override
  Widget build(BuildContext context) {
    return type == "login"
        ? LoginButton(content: content)
        : SignupButton(content: content);
  }
}

class LoginButton extends StatelessWidget {
  final String content;

  const LoginButton({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(1.sw, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => navigateToLogin(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.login,
            color: ColorsTheme.point,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: ColorsTheme.point,
            ),
          ),
        ],
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  final String content;

  const SignupButton({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    void navigateToSignup() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignupFlow(),
        ),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(1.sw, 55.h),
        backgroundColor: ColorsTheme.point,
        side: const BorderSide(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => navigateToSignup(),
      child: Text(
        "Signup with ID/PW",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
