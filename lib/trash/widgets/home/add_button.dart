import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';

class AddButton extends StatelessWidget {
  final String src;
  final Function handleClick;

  const AddButton({
    super.key,
    required this.src,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleClick(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(MediaQuery.of(context).size.width, 78),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: ColorTheme.infoBlue.withOpacity(0.1),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Image.asset(src),
          ],
        ),
      ),
    );
  }
}
