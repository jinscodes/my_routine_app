import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // print(context.watch<ExerciseProvider>().getWorkoutList());
          },
          child: Text(
            "${context.watch<ExerciseProvider>().getWorkoutList()}",
          ),
        ),
      ),
    );
  }
}
