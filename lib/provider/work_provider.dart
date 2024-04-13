import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/utilities/api.dart';

class ExerciseProvider with ChangeNotifier {
  final List list = [];

  List getExerciseList() {
    _fetchWorkouts();

    return list;
  }

  void _fetchWorkouts() async {
    Response res = await GetApi(apiUrl: "/workout").getData();
    final result = res.data;

    print(result);

    list.clear();
    list.addAll(result);
    notifyListeners();
  }
}
