import 'package:flutter/material.dart';
import 'package:workout_app/styles/font_inika.dart';

class Routine extends StatefulWidget {
  final String content;

  const Routine({super.key, required this.content});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    String content = widget.content;

    return Container(
      alignment: Alignment.centerLeft,
      height: 90,
      padding: const EdgeInsets.only(
        left: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFBBBBBB),
          ),
        ),
      ),
      child: FontInika(
        content: content,
        fontSize: 15,
      ),
    );
  }
}
