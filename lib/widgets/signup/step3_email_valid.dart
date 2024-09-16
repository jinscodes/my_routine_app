import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/colors.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/utilities/signup/certificate_email.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/pin_input.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/step4_password.dart';

class Step3EmailValidation extends StatefulWidget {
  final String emailPassKey;

  const Step3EmailValidation({super.key, required this.emailPassKey});

  @override
  State<Step3EmailValidation> createState() => _Step3EmailValidationState();
}

class _Step3EmailValidationState extends State<Step3EmailValidation> {
  late String emailPassKey;
  late FocusNode myFocusNode;
  TextEditingController emailValidController = TextEditingController();
  String? isEmpty;

  void _navigateToNext(TextEditingController controller) {
    if (emailPassKey == controller.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Step4Password(),
        ),
      );
    }
  }

  void retransmit() async {
    final controller =
        Provider.of<SignupModel>(context, listen: false).emailController;
    final email = controller.text;

    String res = await certificateEmail(email);
    emailPassKey = res;
  }

  @override
  void initState() {
    myFocusNode = FocusNode();
    myFocusNode.addListener(() => setState(() {}));
    emailPassKey = widget.emailPassKey;
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
                    PinInput(emailValidController: emailValidController),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () => retransmit(),
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
                      focusNode: myFocusNode,
                      handlePressed: () =>
                          _navigateToNext(emailValidController),
                      content: "확인",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
