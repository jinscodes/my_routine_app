import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';

class IdAndPw extends StatefulWidget {
  const IdAndPw({super.key});

  @override
  State<IdAndPw> createState() => _IdAndPwState();
}

class _IdAndPwState extends State<IdAndPw> {
  TextEditingController id = TextEditingController();
  TextEditingController pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputString(content: "id", controller: id),
        const SizedBox(
          height: 155,
        ),
      ],
    );
  }
}
