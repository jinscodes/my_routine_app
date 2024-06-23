import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetApi {
  String apiUrl;
  String? params;
  String? isRequiredHeader;

  GetApi({
    required this.apiUrl,
    this.params,
    this.isRequiredHeader,
  });

  Future getData() async {
    await dotenv.load(fileName: ".env");

    String? baseUrl = dotenv.env["BASE_URL"];

    if (baseUrl == null) {
      throw Exception("BASE_URL is not set in .env file");
    }

    String url = "$baseUrl$apiUrl";

    Dio dio = Dio();

    Response res = await dio.get(
      url,
    );

    print("api: $res");

    return res;
  }
}

class PostApi {
  String apiUrl;
  dynamic body;
  bool? isRequiredHeader;

  PostApi({
    required this.apiUrl,
    required this.body,
    this.isRequiredHeader,
  });

  Future postData() async {
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

    return res.data;
  }
}

class PatchApi {
  String apiUrl;
  dynamic body;
  bool? isRequiredHeader;

  PatchApi({
    required this.apiUrl,
    required this.body,
    this.isRequiredHeader,
  });

  Future patchData() async {
    await dotenv.load(fileName: ".env");
    // String token = await getLoginToken();

    String? baseUrl = dotenv.env["BASE_URL"];

    if (baseUrl == null) {
      throw Exception("BASE_URL is not set in .env file");
    }

    String url = "$baseUrl$apiUrl";

    Dio dio = Dio();

    Response res = await dio.patch(
      url,
      // options: Options(
      //   headers: {
      //     "authorization": "Bearer $token",
      //   },
      // ),
      data: body,
    );

    return res.data;
  }
}

class DeleteApi {
  String apiUrl;

  DeleteApi({
    required this.apiUrl,
  });

  Future deleteData() async {
    await dotenv.load(fileName: ".env");

    String? baseUrl = dotenv.env["BASE_URL"];

    if (baseUrl == null) {
      throw Exception("BASE_URL is not set in .env file");
    }

    String url = "$baseUrl$apiUrl";

    Dio dio = Dio();

    Response res = await dio.delete(url);

    return res.data;
  }
}
