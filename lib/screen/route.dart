import 'package:flutter/material.dart';
import 'package:library_proect/screen/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return navigate(const SplashScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteName {
  static const String splash = '/';
}
