import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NavigationApp {
  navigateTo(context, widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  navigateToFinish(context, widget) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
  }
}
