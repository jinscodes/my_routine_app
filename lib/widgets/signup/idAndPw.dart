import 'package:flutter/material.dart';
import 'package:workout_app/common/input_string.dart';

class IdAndPw extends StatefulWidget {
  final TextEditingController id;
  final TextEditingController pw;

  const IdAndPw({super.key, required this.id, required this.pw});

  @override
  State<IdAndPw> createState() => _IdAndPwState();
}

class _IdAndPwState extends State<IdAndPw> {
  @override
  Widget build(BuildContext context) {
    TextEditingController id = widget.id;
    TextEditingController pw = widget.pw;

    return SizedBox(
      height: 200,
      child: Column(
        children: [
          InputString(content: "id", controller: id),
          const SizedBox(
            height: 15,
          ),
          InputString(content: "pw", controller: pw),
        ],
      ),
    );
  }
}
