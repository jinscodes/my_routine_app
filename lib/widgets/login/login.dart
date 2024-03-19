import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loginUser(String userId, String password) async {
  Dio dio = Dio();
  String? baseUrl = dotenv.env["BASE_URL"];

  Response res = await dio.post(
    "$baseUrl/login",
    data: {
      "userId": userId,
      "password": password,
    },
  );
}
