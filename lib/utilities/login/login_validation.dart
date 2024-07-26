import 'package:flutter/material.dart';
import 'package:workout_app/utilities/api/http_method.dart';
import 'package:workout_app/utilities/manage_login_token.dart';

void loginValidation(BuildContext context, String id, String pw) async {
  try {
    print("Working with $id/$pw");
    Map<String, dynamic> res = await PostApi(
      apiUrl: "/login",
      body: {
        "userId": id,
        "password": pw,
      },
    ).postData();

    String loginToken = res["token"];

    await setLoginToken(loginToken);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => const Home(),
    //   ),
    // );
  } catch (e) {
    print("Err: $e");
  }
}
