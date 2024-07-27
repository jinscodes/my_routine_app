import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/widgets/signup/step1_name.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsTheme.gray200,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 120.h, 25, 50.h),
            child: Step1Name(
              controller: nameController,
              title: "title",
            ),
          ),
        ),
      ),
    );
  }
}
