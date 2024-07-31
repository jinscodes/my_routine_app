import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_app/colors.dart';

class Step1Name extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;

  const Step1Name({
    super.key,
    required this.nameController,
    required this.emailController,
  });

  @override
  State<Step1Name> createState() => _Step1NameState();
}

class _Step1NameState extends State<Step1Name> {
  late TextEditingController nameController;
  final FocusNode _focusNode = FocusNode();

  label() {
    if (_focusNode.hasFocus) {
      return Text(
        "이름",
        style: TextStyle(
          fontSize: 16.sp,
          color: ColorsTheme.point,
        ),
      );
    } else if (!_focusNode.hasFocus && nameController.text.isNotEmpty) {
      return Text(
        "이름",
        style: TextStyle(
          fontSize: 16.sp,
          color: ColorsTheme.gray600,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  void initState() {
    nameController = widget.nameController;
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    nameController.clear();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 175.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "이름을 입력해주세요",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                      SizedBox(
                        height: 20,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: label(),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        focusNode: _focusNode,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            bottom: 10,
                            top: 5,
                          ),
                          hintText: "이름",
                          hintStyle: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsTheme.gray600,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorsTheme.gray600,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: ColorsTheme.point,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(1.sw, 80),
                    backgroundColor: ColorsTheme.point,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: ColorsTheme.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
