import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/pin_input.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';

class Step3EmailValidation extends StatefulWidget {
  const Step3EmailValidation({super.key});

  @override
  State<Step3EmailValidation> createState() => _Step3EmailValidationState();
}

class _Step3EmailValidationState extends State<Step3EmailValidation> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailValidationController =
        Provider.of<SignupModel>(context).emailValidationController;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/signupBg.png"),
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
                Column(
                  children: [
                    SizedBox(
                      height: 175.h,
                    ),
                    const AlignedTitleText(
                      title: "이메일로 전송된\n인증번호 6자리를 입력해주세요",
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    const PinInput(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _focusNode.hasFocus ? 20.h : 70.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => print("clicked"),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          "인증번호 재전송",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: ColorsTheme.point,
                          ),
                        ),
                      ),
                      SignupButton(
                        handlePressed: () => print("object"),
                        content: "확인",
                      ),
                    ],
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
