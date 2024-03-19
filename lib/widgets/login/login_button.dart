import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isSocialLogin;
  final bool isIcon;
  final Icon? icon;
  final String content;
  final String? imgPath;
  final Function onPressed;

  const LoginButton({
    super.key,
    required this.isSocialLogin,
    required this.content,
    required this.isIcon,
    this.imgPath,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSocialLogin ? 80 : MediaQuery.of(context).size.width,
      height: isSocialLogin ? 45 : 60,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon ? icon! : Image.asset(imgPath!),
            SizedBox(
              width: isSocialLogin ? 6 : 10,
            ),
            Text(
              content,
              style: TextStyle(
                color: Colors.black,
                fontSize: isSocialLogin ? 12 : 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
