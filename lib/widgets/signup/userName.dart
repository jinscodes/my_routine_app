import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';

class UserName extends StatefulWidget {
  final TextEditingController username;
  const UserName({super.key, required this.username});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = widget.username;

    return Column(
      children: [
        InputString(content: "username", controller: username),
        const SizedBox(
          height: 98,
        )
      ],
    );
  }
}
