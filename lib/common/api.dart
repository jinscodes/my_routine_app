import 'package:flutter_dotenv/flutter_dotenv.dart';

class Global {
  String? baseUrl = dotenv.env["BASE_URL"];
}

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

// class PostApi extends Global {
//   String apiUrl;
//   dynamic body;
//   Bool? isRequiredHeader;

//   PostApi({
//     required this.apiUrl,
//     required this.body,
//     this.isRequiredHeader,
//   });

//   postData() async {
//     String url = "$baseUrl/$apiUrl";
//     print(url);

//     Dio dio = Dio();

//     if (isRequiredHeader != null) {
//       // set header
//     }

//     Response res = await dio.post(
//       url,
//       data: body,
//     );

//     return res;
//   }
// }
