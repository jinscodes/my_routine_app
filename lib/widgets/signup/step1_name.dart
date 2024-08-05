import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/models/signup_model.dart';
import 'package:workout_app/widgets/signup/aligned_title_text.dart';
import 'package:workout_app/widgets/signup/label_text.dart';
import 'package:workout_app/widgets/signup/signup_button.dart';
import 'package:workout_app/widgets/signup/signup_textfield.dart';
import 'package:workout_app/widgets/signup/step2_email.dart';

class Step1Name extends StatefulWidget {
  const Step1Name({
    super.key,
  });

  @override
  State<Step1Name> createState() => _Step1NameState();
}

class _Step1NameState extends State<Step1Name> {
  final FocusNode _focusNode = FocusNode();

  void _navigateToNext(TextEditingController nameController) {
    if (nameController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => SignupModel(),
            child: const Step2Email(),
          ),
        ),
      );
    } else {
      // alert something
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = Provider.of<SignupModel>(context).nameController;

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
                        title: "이름을 입력해주세요",
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      LabelText(
                        title: "이름",
                        focusNode: _focusNode,
                        controller: nameController,
                      ),
                      SignupTextField(
                        controller: nameController,
                        focusNode: _focusNode,
                        title: "이름",
                      ),
                    ],
                  ),
                  SignupButton(
                    focusNode: _focusNode,
                    handlePressed: () => _navigateToNext(nameController),
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
