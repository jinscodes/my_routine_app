import 'package:shared_preferences/shared_preferences.dart';

setLoginToken(String loginToken) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString("login_token", loginToken);
}

getLoginToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? loginToken = prefs.getString("login_token");

  return loginToken;
}

removeLoginToken(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(key);
}
