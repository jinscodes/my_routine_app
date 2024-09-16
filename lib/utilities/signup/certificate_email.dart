import 'package:workout_app/utilities/api/http_method.dart';

Future<String> certificateEmail(String email) async {
  try {
    String res = await PostApi(
      apiUrl: "/emailCheck",
      body: {
        "email": email,
      },
    ).postData();

    return res;
  } catch (e) {
    print(e);

    return "";
  }
}
