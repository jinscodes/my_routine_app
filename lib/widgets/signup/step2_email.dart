import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';
import 'package:workout_app/widgets/signup/step3_email_validation.dart';

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

  void _navigateToNext(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => SignupModel(),
            child: const Step3EmailValidation(),
          ),
        ),
      );
    } else {
      setState(() {
        isEmpty = "올바르지 않은 이메일 형식입니다";
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
                    handlePressed: () => _navigateToNext(emailController),
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
