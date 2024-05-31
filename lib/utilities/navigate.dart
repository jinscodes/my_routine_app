import 'package:flutter/material.dart';

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
