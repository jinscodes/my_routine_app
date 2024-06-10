import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/screens/home_screen.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/screens/signup_screen.dart';
import 'package:workout_app/utilities/complete_page.dart';
import 'package:workout_app/widgets/addExercise/addExercise.dart';
import 'package:workout_app/widgets/addExercise/editExercise.dart';
import 'package:workout_app/widgets/login/login_with_id.dart';

enum NavigateType {
  push,
  pushRep,
}

enum CompleteType {
  complete,
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

  void completePage(Function navigateTo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompletePage(
          navigator: navigateTo,
          buttonTitle: "Next",
        ),
      ),
    );
  }
}

class NavigateTo {
  BuildContext context;
  NavigateType? type;

  Map<dynamic, dynamic>? params;

  NavigateTo({
    required this.context,
    this.type,
    this.params,
  });

  void toLogin() {
    Navigate(
      context: context,
      builder: (_) => const LoginScreen(),
    ).pushReplacement();
  }

  void toLoginWithId() {
    Navigate(
      context: context,
      builder: (_) => const LoginWithId(),
    ).push();
  }

  void toSignup() {
    Navigate(
      context: context,
      builder: (_) => const SignupScreen(),
    ).push();
  }

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
    Navigate(
      context: context,
      builder: (context) => const AddExercise(),
    ).push();
  }

  void toEditExercise() {
    Navigate(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => ExerciseProvider(),
        child: EditExercise(
          title: params!["title"],
          exerciseType: params!["exerciseType"],
          description: params!["description"],
          id: params!["id"],
        ),
      ),
    ).push();
  }

  //
}
