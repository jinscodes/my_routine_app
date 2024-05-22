import 'package:flutter/material.dart';

class Navigate {
  BuildContext context;
  MaterialPageRoute materialPageRoute;

  Navigate({
    required this.context,
    required this.materialPageRoute,
  });

  void navigatePushScreen() {
    Navigator.push(context, materialPageRoute);
  }

  void navigateReplacementScreen() {
    Navigator.push(context, materialPageRoute);
  }

  void navigatePopScreen() {
    Navigator.of(context).pop();
  }
}
