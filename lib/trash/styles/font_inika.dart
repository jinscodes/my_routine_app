import 'package:flutter/material.dart';

class FontInika extends StatelessWidget {
  final String content;
  final double? fontSize;
  final bool? isBold;

  const FontInika(
      {super.key, this.fontSize, this.isBold, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontFamily: "Inika",
        fontWeight: isBold == null ? FontWeight.normal : FontWeight.bold,
        fontSize: fontSize ?? 16,
      ),
    );
  }
}
