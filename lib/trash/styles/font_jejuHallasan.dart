import 'package:flutter/material.dart';

class FontJejuHallasan extends StatelessWidget {
  final String content;
  final double? fontSize;
  final bool? isBold;
  final Color? isColor;

  const FontJejuHallasan(
      {super.key,
      required this.content,
      this.fontSize,
      this.isBold,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontFamily: "JejuHallasan",
        fontWeight: isBold == null ? FontWeight.normal : FontWeight.bold,
        fontSize: fontSize ?? 16,
        color: isColor ?? Colors.black,
      ),
    );
  }
}
