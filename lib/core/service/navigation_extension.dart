import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationX on BuildContext {
  Future<T?> pushNamed<T>(String routeName, {Object? extra}) {
    return GoRouter.of(this).push<T>(routeName, extra: extra);
  }

  void pushReplacementNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).pushReplacement(routeName, extra: extra);
  }

  void goNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).go(routeName, extra: extra);
  }

  void safePop({String fallback = '/'}) {
    if (canPop()) {
      pop();
    } else {
      go(fallback);
    }
  }
}