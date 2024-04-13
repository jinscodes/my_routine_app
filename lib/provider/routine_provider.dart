import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/utilities/api.dart';

class RoutineProvider with ChangeNotifier {
  final List list = [];

  List getRoutineList() {
    _fetchRoutines();

    return list;
  }

  void _fetchRoutines() async {
    Response res = await GetApi(
      apiUrl: "apiUrl",
    ).getData();

    final result = res.data;

    list.clear();
    list.addAll(result);
    notifyListeners();
  }
}
