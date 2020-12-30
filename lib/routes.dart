import 'package:flutter/material.dart';
import 'package:sejutacita_test/configs/fade_ruote.dart';
import 'package:sejutacita_test/ui/pages/pages.dart';

enum Routes { home }

class _Paths {
  // static const String splash = '/';
  static const String home = '/home';
  static const Map<Routes, String> _pathMap = {
    // Routes.splash: _Paths.splash,
    Routes.home: _Paths.home
  };

  static String of(Routes route) => _pathMap[route];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case _Paths.splash:
      //   return FadeRoute(page: SplashScreen());
      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future push<T>(Routes route, [T arguments]) =>
      state.pushNamed(_Paths.of(route), arguments: arguments);

  static Future replaceWith<T>(Routes route, [T arguments]) =>
      state.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state.pop();

  static NavigatorState get state => navigatorKey.currentState;
}
