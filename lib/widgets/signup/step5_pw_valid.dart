import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_complete.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';

class Step5PasswordValidation extends StatefulWidget {
  const Step5PasswordValidation({
    super.key,
  });

  @override
  State<Step5PasswordValidation> createState() =>
      _Step5PasswordValidationState();
}

class _Step5PasswordValidationState extends State<Step5PasswordValidation> {
  late FocusNode myFocusNode;
  String? isEmpty;
  TextEditingController pwValidController = TextEditingController();

  void _navigateToNext() {
    final pwController =
        Provider.of<SignupModel>(context, listen: false).pwController;

    if (pwValidController.text.isNotEmpty) {
      if (pwController.text == pwValidController.text) {
        _postSignup();
      } else {
        setState(() {
          isEmpty = "비밀번호가 일치하지 않습니다";
        });
      }
    } else {
      setState(() {
        isEmpty = "비밀번호를 입력해주세요";
      });
    }
  }

  void _postSignup() {
    final pwController =
        Provider.of<SignupModel>(context, listen: false).pwController.text;
    final nameController =
        Provider.of<SignupModel>(context, listen: false).nameController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SignupComplete(),
      ),
    );
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
                        title: "비밀번호를 한번 더\n입력해주세요",
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      LabelText(
                        title: "비밀번호 확인",
                        focusNode: myFocusNode,
                        controller: pwValidController,
                      ),
                      SignupTextField(
                        controller: pwValidController,
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
