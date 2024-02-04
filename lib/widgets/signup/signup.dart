import 'package:flutter/material.dart';
import 'package:workout_app/common/submit_button.dart';
import 'package:workout_app/common/title_text.dart';
import 'package:workout_app/widgets/signup/checkInfo.dart';
import 'package:workout_app/widgets/signup/idAndPw.dart';
import 'package:workout_app/widgets/signup/userName.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int step = 0;
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController userName = TextEditingController();

  nextStep() {
    if (step == 0) {
      if (id.text != "" && pw.text != "") {
        // Needed to validate id later
        setState(() {
          step += 1;
        });
      } else {
        showSnackBar(context, "Enter id or pw!");
      }
    } else if (step == 1) {
      if (userName.text != "") {
        setState(() {
          step += 1;
        });
      } else {
        showSnackBar(context, "Enter usename!");
      }
    } else {
      print("Submit");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 40,
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(content: "SIGNUP"),
                  const SizedBox(
                    height: 43,
                  ),
                  Builder(
                    builder: (context) {
                      if (step == 0) {
                        return IdAndPw(
                          id: id,
                          pw: pw,
                        );
                      } else if (step == 1) {
                        return UserName(
                          username: userName,
                        );
                      } else {
                        return CheckInfo(
                          id: id,
                          pw: pw,
                          userName: userName,
                        );
                      }
                    },
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: SubmitButton(
                  content: "Next",
                  handleClick: () {
                    nextStep();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
