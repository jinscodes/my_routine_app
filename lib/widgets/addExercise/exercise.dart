import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class Exercise extends StatelessWidget {
  final String title;
  final String description;

  const Exercise({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorTheme.gray,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "C",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          description.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorTheme.darkgray,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ],
      ),
    );
  }
}
