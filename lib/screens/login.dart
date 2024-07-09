import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/widgets/appbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
  }

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
                    controller: idController,
                    onChanged: (value) => setState(() => idController.text),
                    decoration: InputDecoration(
                      hintText: "Enter your ID",
                      hintStyle: TextStyle(
                        fontSize: 20.sp,
                        color: ColorTheme.gray,
                      ),
                      suffixIcon: idController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () =>
                                  setState(() => idController.clear()),
                              icon: const Icon(
                                Icons.cancel_rounded,
                                color: ColorTheme.gray,
                              ),
                            )
                          : null,
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
