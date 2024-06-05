import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/screens/home_screen.dart';

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
  Object? params;

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
}

enum NavigateType {
  push,
  pushRep,
}
