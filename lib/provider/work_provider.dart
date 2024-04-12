import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/utilities/api.dart';

class ExerciseProvider with ChangeNotifier {
  final List list = [];

  List getWorkoutList() {
    _fetchWorkouts();
    return list;
  }

  void _fetchWorkouts() async {
    Response res = await GetApi(apiUrl: "/workout").getData();
    final result = res.data;

    list.clear();
    list.addAll(result);
    notifyListeners();
  }
}
