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
    Response res = await GetApi(
      apiUrl: "/workout",
    ).getData();

    final result = res.data;

    list.clear();
    list.addAll(result);
    notifyListeners();
  }

  void deleteItem(int index, int id) {
    list.removeAt(index);
    DeleteApi(
      apiUrl: "/workout/$id",
    ).deleteData();
    notifyListeners();
  }

  Future<Map<String, dynamic>> patchItem(int id, Map body) async {
    Map<String, dynamic> res = await PatchApi(
      apiUrl: "/workout/$id",
      body: body,
    ).patchData();

    notifyListeners();

    return res;
  }
}
