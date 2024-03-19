// // ignore_for_file: use_build_context_synchronously

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:workout_app/common/input_string.dart';
// import 'package:workout_app/common/submit_button.dart';
// import 'package:workout_app/common/title_text.dart';
// // import 'package:workout_app/widgets/login/home/home.dart';

// class Login extends StatefulWidget {
//   String token;
//   Function setToken;

//   Login({super.key, required this.token, required this.setToken});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     String token = widget.token;
//     Function setToken = widget.setToken;
//     TextEditingController id = TextEditingController();
//     TextEditingController pw = TextEditingController();

//     login() async {
//       if (id.text != "" && pw.text != "") {
//         try {
//           Dio dio = Dio();

//           Response res = await dio.post(
//             "http://localhost:8080/login",
//             data: {
//               "id": id.text,
//               "pw": pw.text,
//             },
//           );

//           if (res.statusCode == 200) {
//             // set jwtToken later
//             return Navigator.push(
//               context,
//               MaterialPageRoute(
//                   // builder: (context) => const Home(),
//                   ),
//             );
//           }
//         } catch (e) {
//           showSnackBar(context, "Login failed 🥲");
//         }
//       } else {
//         showSnackBar(context, "Enter id or pw!");
//       }
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 60,
//           vertical: 40,
//         ),
//         child: Center(
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const TitleText(content: "LOGIN"),
//                   const SizedBox(
//                     height: 42,
//                   ),
//                   InputString(
//                     content: "id",
//                     controller: id,
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   InputString(
//                     content: "pw",
//                     controller: pw,
//                   ),
//                   const SizedBox(
//                     height: 58,
//                   ),
//                 ],
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: SubmitButton(
//                   content: "Login",
//                   handleClick: login,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void showSnackBar(BuildContext context, String content) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         content,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 16,
//         ),
//       ),
//       duration: const Duration(
//         seconds: 2,
//       ),
//     ),
//   );
// }
