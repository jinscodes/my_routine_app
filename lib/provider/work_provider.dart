import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  final List _workoutList = List.empty(growable: true);

  List getWorkoutList() {
    _fetchWorkouts();
    return _workoutList;
  }

  void _fetchWorkouts() async {
    final res = await Dio().get("path");
    final result = res.data;
    print(res);
    print(res.data);

    _workoutList.clear();
    _workoutList.addAll(result);
    notifyListeners();
  }
}
