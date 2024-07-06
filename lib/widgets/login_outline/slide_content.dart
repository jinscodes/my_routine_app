import 'package:flutter/material.dart';

class SlideContent extends StatelessWidget {
  final String content;
  final String ImagePath;

  const SlideContent({
    super.key,
    required this.content,
    required this.ImagePath,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(ImagePath),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              content,
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
