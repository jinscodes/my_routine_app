import 'package:workout_app/utilities/api/http_method.dart';
import 'package:workout_app/utilities/manage_login_token.dart';

void loginValidation(id, pw) async {
  try {
    print("Working with $id/$pw");
    String loginToken = await PostApi(
      apiUrl: "/login",
      body: {
        "userId": id,
        "password": pw,
      },
    ).postData();

    setLoginToken(loginToken);
  } catch (e) {
    print("Err: $e");
  }
}
