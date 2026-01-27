import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Now returns a Future of any result from the pushed screen
Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
  final context = navigatorKey.currentContext!;
  return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
}

Future<void> popScreen<T extends Object?>([T? result]) async {
  final context = navigatorKey.currentContext!;
  Navigator.pop(context, result);
}

void popAndPushScreen(String routeName, {Object? arguments}) {
  final context = navigatorKey.currentContext!;
  Navigator.popAndPushNamed(context, routeName, arguments: arguments);
}

Future<T?> removeAllAndPushScreen<T extends Object?>(
  String routeName, {
  Object? arguments,
}) {
  final context = navigatorKey.currentContext!;
  return Navigator.pushNamedAndRemoveUntil<T>(
    context,
    routeName,
    (Route<dynamic> route) => false,
    arguments: arguments,
  );
}

Future<T?> removeUntilAndPushScreen<T extends Object?>(
  String routeName,
  String routeToKeep, {
  Object? arguments,
}) {
  final context = navigatorKey.currentContext!;
  return Navigator.pushNamedAndRemoveUntil<T>(
    context,
    routeName,
    (Route<dynamic> route) => route.settings.name == routeToKeep,
    arguments: arguments,
  );
}
