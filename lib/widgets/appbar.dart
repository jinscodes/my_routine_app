import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String content;

  const Appbar({
    super.key,
    required this.content,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        content,
        style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
