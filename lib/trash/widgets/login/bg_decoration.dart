import 'package:flutter/material.dart';

class BgDecoration extends StatelessWidget {
  final String imgRoute;
  final List<String> content;
  final String stepImgRoute;

  const BgDecoration({
    super.key,
    required this.imgRoute,
    required this.content,
    required this.stepImgRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                imgRoute,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content[1],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    stepImgRoute,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
