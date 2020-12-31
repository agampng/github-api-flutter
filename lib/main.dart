import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sejutacita_test/configs/config.dart';
import 'package:sejutacita_test/configs/font.dart';
import 'package:sejutacita_test/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      color: Colors.white,
      title: 'Github API Search',
      theme: ThemeData(
        unselectedWidgetColor: Colors.amber,
        fontFamily: Fonts.circularStd,
        textTheme: theme.textTheme.apply(
          fontFamily: Fonts.circularStd,
          displayColor: Colors.black,
        ),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / Constants.designScreenSize.width, 1.0);

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      },
    );
  }
}
