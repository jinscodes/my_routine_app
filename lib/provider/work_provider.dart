// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:workout_app/utilities/api.dart';

// class WorkoutProvider with ChangeNotifier {
//   final List _workoutList = List.empty(growable: true);

//   List getWorkoutList() {
//     _fetchWorkouts();
//     return _workoutList;
//   }

//   void _fetchWorkouts() async {
//     Response res = await GetApi(apiUrl: "/workout").getData();
//     final result = res.data;
//     print("Provider: $res");
//     print("Provider data: ${res.data}");

//     _workoutList.clear();
//     _workoutList.addAll(result);
// notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
