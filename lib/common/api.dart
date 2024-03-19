import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Global {

//   String? baseUrl = dotenv.env["BASE_URL"];
// }

// class GetApi {
//   String apiUrl;
//   String params;
//   String? isRequiredHeader;

//   GetApi({
//     required this.apiUrl,
//     required this.params,
//     this.isRequiredHeader,
//   });

//   getData() async {}
// }

class PostApi {
  String apiUrl;
  dynamic body;
  bool? isRequiredHeader;

  PostApi({
    required this.apiUrl,
    required this.body,
    this.isRequiredHeader,
  });

  Future<void> postData() async {
    try {
      print("post");
      await dotenv.load(fileName: ".env");

      String? baseUrl = dotenv.env["BASE_URL"];

      if (baseUrl == null) {
        throw Exception("BASE_URL is not set in .env file");
      }

      String url = "$baseUrl$apiUrl";

      Dio dio = Dio();

      Response res = await dio.post(
        url,
        data: body,
      );

      print("Response: $res");
    } catch (e) {
      print("Error: $e");
    }
  }
}
