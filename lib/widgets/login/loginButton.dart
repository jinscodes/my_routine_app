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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: isSocialLogin
            ? const Size(30, 40)
            : Size(MediaQuery.of(context).size.width, 60.0),
      ),
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon ? icon! : Image.asset(imgPath!),
          SizedBox(
            width: isSocialLogin ? 6 : 10,
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
