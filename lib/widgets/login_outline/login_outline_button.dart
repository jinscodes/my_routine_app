import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/screens/login.dart';
import 'package:workout_app/trash/common/color.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;

    navigateToLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 52),
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
            color: Colors.black,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 52.h),
        backgroundColor: ColorTheme.mainBlue,
        side: const BorderSide(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        print("Will navigate to signup page");
      },
      child: Text(
        "Signup with ID/PW",
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
