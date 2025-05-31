import 'package:flutter/material.dart';

class NavigationUtils {
  static Future<void> pushReplacement(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<void> push(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
