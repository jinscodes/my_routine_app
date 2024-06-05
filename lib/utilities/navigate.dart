import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/screens/home_screen.dart';
import 'package:workout_app/widgets/addExercise/addExercise.dart';
import 'package:workout_app/widgets/addExercise/editExercise.dart';

enum NavigateType {
  push,
  pushRep,
}

class Navigate {
  BuildContext context;
  WidgetBuilder? builder;

  Navigate({
    required this.context,
    this.builder,
  });

  void push() {
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder!),
      );
    } else {
      throw Exception('Builder cannot be null');
    }
  }

  void pushReplacement() {
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder!),
      );
    } else {
      throw Exception('Builder cannot be null');
    }
  }

  void pop() {
    Navigator.of(context).pop();
  }
}

class NavigateTo {
  BuildContext context;
  NavigateType type;
  Map<dynamic, dynamic>? params;

  NavigateTo({
    required this.context,
    required this.type,
    this.params,
  });

  void toHome() {
    if (type == NavigateType.push) {
      Navigate(
        context: context,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => ExerciseProvider(),
          child: const HomeScreen(),
        ),
      ).push();
    } else {
      Navigate(
        context: context,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => ExerciseProvider(),
          child: const HomeScreen(),
        ),
      ).pushReplacement();
    }
  }

  void toAddExercise() {
    if (type == NavigateType.push) {
      Navigate(
        context: context,
        builder: (context) => const AddExercise(),
      ).push();
    } else {
      Navigate(
        context: context,
        builder: (context) => const AddExercise(),
      ).pushReplacement();
    }
  }

  void toEditExercise() {
    if (type == NavigateType.push) {
      Navigate(
        context: context,
        builder: (context) => EditExercise(
          title: params!["title"],
          description: params!["description"],
          id: params!["id"],
        ),
      ).push();
    }
  }
}
