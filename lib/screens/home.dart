import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 72.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: SizedBox(
                  width: 1.sw,
                  height: 55.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello, Jinsung",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                width: 1.sw,
                height: 0.9.sh,
                decoration: const BoxDecoration(
                  color: ColorsTheme.home,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     removeLoginToken();
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) => const LoginOutline(),
              //       ),
              //     );
              //   },
              //   child: const Text("LOGOUT"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
