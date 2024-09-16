import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/utilities/signup/certificate_email.dart';
import 'package:workout_app/utilities/signup/email_double_check.dart';
import 'package:workout_app/utilities/validate_email.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';
import 'package:workout_app/widgets/signup/step3_email_valid.dart';

class Step2Email extends StatefulWidget {
  const Step2Email({
    super.key,
  });

  @override
  State<Step2Email> createState() => _Step2EmailState();
}

class _Step2EmailState extends State<Step2Email> {
  late FocusNode myFocusNode;
  String? isEmpty;

  void _proceedEmailValidation() async {
    final emailController =
        Provider.of<SignupModel>(context, listen: false).emailController;
    final email = emailController.text;

    if (email.isEmpty) {
      _setErrorMessage("이메일을 입력해주세요");
      return;
    }

    if (!validateEmail(email)) {
      _setErrorMessage("올바르지 않은 이메일 형식입니다");
      return;
    }

    bool isAvailable = await emailDoubleCheck(email);

    if (isAvailable) {
      String res = await certificateEmail(email);

      if (res.isEmpty) {
        _setErrorMessage("에러가 발생하였습니다. 재인증해주세요");
        return;
      }

      _navigateToNext(res);
    } else {
      _setErrorMessage("중복된 이메일 입니다");
    }
  }

  void _setErrorMessage(String message) {
    setState(() {
      isEmpty = message;
    });
  }

  void _navigateToNext(String emailPassKey) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Step3EmailValidation(
          emailPassKey: emailPassKey,
        ),
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
    final emailController = Provider.of<SignupModel>(context).emailController;

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
                        title: "이메일을 입력해주세요",
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      LabelText(
                        title: "이메일",
                        focusNode: myFocusNode,
                        controller: emailController,
                      ),
                      SignupTextField(
                        controller: emailController,
                        title: "이메일",
                        myFocusNode: myFocusNode,
                        errorText: isEmpty,
                      ),
                    ],
                  ),
                  SignupButton(
                    focusNode: myFocusNode,
                    handlePressed: () => _proceedEmailValidation(),
                    content: "인증번호 받기",
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
