import 'package:flutter/cupertino.dart';

class CustomRouter {
  const CustomRouter._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static push(Route<Widget> route) async {
    return navigatorKey.currentState?.push(route);
  }

  static pushAndReplace(Route<Widget> route) async {
    return navigatorKey.currentState?.pushReplacement(route);
  }

  static popUntilHome() async {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  static popUntilRouteName(String routeName) async {
    return navigatorKey.currentState?.popUntil((route) => route.settings.name == routeName);
  }

  static pop() async {
    return navigatorKey.currentState?.pop();
  }

  static CupertinoPageRoute<T> cupertinoTransition<T>({
    required RouteSettings settings,
    required Widget screen,
  }) {
    return CupertinoPageRoute<T>(
      settings: settings,
      builder: (BuildContext context) => screen,
    );
  }
}
