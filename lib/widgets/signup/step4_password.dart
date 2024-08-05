import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';

class Step4Password extends StatefulWidget {
  const Step4Password({super.key});

  @override
  State<Step4Password> createState() => _Step4PasswordState();
}

class _Step4PasswordState extends State<Step4Password> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pwController = Provider.of<SignupModel>(context).pwController;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                        title: "비밀번호를 입력해주세요",
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      LabelText(
                        title: "비밀번호",
                        focusNode: _focusNode,
                        controller: pwController,
                      ),
                      SignupTextField(
                        controller: pwController,
                        focusNode: _focusNode,
                        title: "비밀번호",
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: _focusNode.hasFocus ? 20.h : 70.h,
                    ),
                    child: SignupButton(
                      handlePressed: () => print("click"),
                      content: "확인",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
