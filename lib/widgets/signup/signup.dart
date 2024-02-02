import 'package:flutter/material.dart';
import 'package:workout_app/common/submit_button.dart';
import 'package:workout_app/common/title_text.dart';
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
        print("1");
        // Needed to validate id later
        setState(() {
          step += 1;
        });
      } else {
        showSnackBar(context);
      }
    } else if (step == 1) {
      if (userName.text != "") {
        print("2");
        setState(() {
          step += 1;
        });
      } else {
        showSnackBar(context);
      }
    } else {
      print("3");
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
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.blue,
                  width: 2,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleText(content: "SIGNUP"),
                    const SizedBox(
                      height: 43,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.red,
                        width: 2,
                      )),
                      child: Builder(
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
                            return const Text("username");
                          }
                        },
                      ),
                    ),
                  ],
                ),
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

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Enter id or pw!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
