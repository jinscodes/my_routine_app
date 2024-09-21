import 'package:dio/dio.dart';
import 'package:workout_app/utilities/api/http_method.dart';

Future<bool> emailDoubleCheck(String email) async {
  try {
    Response<dynamic> res = await GetApi(
      apiUrl: "/id/exists/$email",
    ).getData();

    return res.data["isAvailable"] ?? false;
  } catch (e) {
    // ignore: avoid_print
    print(e);

    return false;
  }
}
