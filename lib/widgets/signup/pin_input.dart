import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 55.w,
  height: 55.h,
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith();

final errorPinTheme = defaultPinTheme.copyDecorationWith();

final submittedPinTheme = defaultPinTheme.copyDecorationWith();

class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onCompleted: (pin) => print(pin),
    );
  }
}
