// import 'package:flutter/material.dart';
// import 'package:workout_app/styles/font_jejuHallasan.dart';

// class NavButton extends StatelessWidget {
//   final String title;
//   final Function handleClick;

//   const NavButton({super.key, required this.title, required this.handleClick});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 250,
//       height: 60,
//       child: ButtonTheme(
//         child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               foregroundColor: const Color(0x00cbcbcb),
//               backgroundColor: const Color(0xFFD9D9D9),
//             ),
//             onPressed: () {
//               handleClick();
//             },
//             child: FontJejuHallasan(
//               content: title,
//               fontSize: 20,
//               isColor: Colors.black,
//             )),
//       ),
//     );
//   }
// }
