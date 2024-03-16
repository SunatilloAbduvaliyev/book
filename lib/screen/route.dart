import 'package:flutter/material.dart';
import 'package:library_proect/data/models/book_model/book_model.dart';
import 'package:library_proect/screen/search/search_screen.dart';
import 'package:library_proect/screen/splash/splash_screen.dart';

import 'home_screen/home_screen.dart';

class AppRoutes {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return navigate(const HomeScreen());

      case RouteName.search:
        return navigate( SearchBook(books: (settings.arguments) as List<BookModel>) as Widget  );

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
  static const String search = '/search';
}
