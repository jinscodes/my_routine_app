import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/widgets/login_outline/login_input.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/appicon_white.png"),
                          const SizedBox(
                            height: 80,
                          ),
                          LoginInput(
                            controller: emailController,
                            title: "Email",
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          LoginInput(
                            controller: pwController,
                            title: "Password",
                            type: "pw",
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          LoginInput(
                            controller: nameController,
                            title: "Username",
                            type: "username",
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("Signup");
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(1.sw, 55.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorTheme.mainBlue,
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
          }),
        ),
      ),
    );
  }
}
