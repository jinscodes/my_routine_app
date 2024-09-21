import 'package:workout_app/utilities/api/http_method.dart';

Future<bool> completeSignup(String email, String name, String password) async {
  try {
    await PostApi(
      apiUrl: "/signup",
      body: {
        "userId": email,
        "password": password,
        "nickname": name,
      },
    ).postData();

    return true;
  } catch (e) {
    // ignore: avoid_print
    print(e);

    return false;
  }
}
