import 'package:flutter/material.dart';

extension BuildContextExtesion on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isLightTheme => Theme.of(this).brightness == Brightness.light;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void popAndpushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).popAndPushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop([Object? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  void popUntilCondition(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void pushNamedAndRemoveUntil(
    String newRouteName,
    String untilRouteName, {
    Object? arguments,
  }) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      newRouteName,
      ModalRoute.withName(untilRouteName),
      arguments: arguments,
    );
  }

  void pushNamedAndRemoveUntilCondition(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }
}
