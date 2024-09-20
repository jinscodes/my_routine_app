import 'package:workout_app/utilities/api/http_method.dart';

void completeSignup(String email, String name, String password) async {
  try {
    await PostApi(
      apiUrl: "/signup",
      body: {
        "userId": email,
        "password": password,
        "nickname": name,
      },
    ).postData();
  } catch (e) {
    print(e);
  }
}
