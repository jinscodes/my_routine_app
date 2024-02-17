import 'package:flutter/material.dart';

class FontInter extends StatelessWidget {
  final String content;
  final double? fontSize;
  final bool? isBold;
  final Color? color;

  const FontInter(
      {super.key,
      this.fontSize,
      this.isBold,
      required this.content,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontFamily: "Inter",
        fontWeight: isBold == null ? FontWeight.normal : FontWeight.bold,
        fontSize: fontSize ?? 16,
        color: color ?? color,
      ),
    );
  }
}
