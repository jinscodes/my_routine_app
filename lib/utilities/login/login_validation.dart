import 'package:workout_app/utilities/api/http_method.dart';
import 'package:workout_app/utilities/manage_login_token.dart';

dynamic loginValidation(String id, String pw) async {
  bool success = false;

  try {
    Map<String, dynamic> res = await PostApi(
      apiUrl: "/login",
      body: {
        "userId": id,
        "password": pw,
      },
    ).postData();

    String loginToken = res["token"];

    await setLoginToken(loginToken);

    success = true;

    return {loginToken, success};
  } catch (e) {
    success = false;
    return {e, success};
  }
}
