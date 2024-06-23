// import 'package:flutter/material.dart';

// class DivText extends StatelessWidget {
//   final String title;
//   final TextEditingController data;

//   const DivText({super.key, required this.title, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 10,
//           ),
//           child: Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontFamily: "JejuHallasan",
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           width: 300,
//           height: 60,
//           padding: const EdgeInsets.symmetric(
//             horizontal: 15,
//           ),
//           decoration: BoxDecoration(
//             color: const Color(0xFFD9D9D9),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             data.text,
//             style: const TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
