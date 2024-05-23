import 'package:flutter/material.dart';

class Navigate {
  BuildContext context;
  WidgetBuilder? builder;

  Navigate({
    required this.context,
    this.builder,
  });

  void navigatePushScreen() {
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder!),
      );
    } else {
      throw Exception('Builder cannot be null');
    }
  }

  void navigateReplacementScreen() {
    if (builder != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: builder!),
      );
    } else {
      throw Exception('Builder cannot be null');
    }
  }

  void navigatePopScreen() {
    Navigator.of(context).pop();
  }
}
