import 'package:flutter/material.dart';

BuildContext get globalContext {
  return Navigate.currentContext;
}

class Navigate {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentContext;
  }

  static push(Widget page) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pop() {
    navigatorKey.currentState!.pop(currentContext);
  }

  static pushAndRemoveUntil(Widget page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static pushReplacement(Widget page) async {
    await navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.height;
  }
}
