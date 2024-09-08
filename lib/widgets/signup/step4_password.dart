import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';
import 'package:workout_app/widgets/signup/step5_pw_valid.dart';

class Step4Password extends StatefulWidget {
  const Step4Password({super.key});

  @override
  State<Step4Password> createState() => _Step4PasswordState();
}

class _Step4PasswordState extends State<Step4Password> {
  late FocusNode myFocusNode;
  String? isEmpty;

  void _navigateToNext() {
    final pwController =
        Provider.of<SignupModel>(context, listen: false).pwController;

    if (pwController.text.isNotEmpty) {
      if (pwController.text.length >= 6) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Step5PasswordValidation(),
          ),
        );
      } else {
        setState(() {
          isEmpty = "비밀번호는 6자 이상 입력하셔야 합니다";
        });
      }
    } else {
      setState(() {
        isEmpty = "비밀번호를 입력해주세요";
      });
    }
  }

  @override
  void initState() {
    myFocusNode = FocusNode();
    myFocusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myFocusNode.removeListener(() => setState(() {}));
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
                        focusNode: myFocusNode,
                        controller: pwController,
                      ),
                      SignupTextField(
                        controller: pwController,
                        title: "비밀번호",
                        myFocusNode: myFocusNode,
                        errorText: isEmpty,
                      ),
                    ],
                  ),
                  SignupButton(
                    focusNode: myFocusNode,
                    handlePressed: () => _navigateToNext(),
                    content: "확인",
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
