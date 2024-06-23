import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';

class AppbarIconButton extends StatelessWidget {
  final Function handleClick;
  final IconData icon;

  const AppbarIconButton({
    super.key,
    required this.handleClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => handleClick(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: ColorTheme.gray.withOpacity(0.4),
            width: 2,
          ),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
