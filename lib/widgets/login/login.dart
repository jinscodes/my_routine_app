import 'package:dio/dio.dart';

Future<void> loginUser(String userId, String password) async {
  Dio dio = Dio();

  Response res = await dio.post(
    "path",
    data: {
      "userId": userId,
      "password": password,
    },
  );
}
