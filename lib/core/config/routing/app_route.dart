import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/core/config/routing/routes.dart';
import 'package:spotify/features/get_start_screen/presentation/get_start_screen.dart';
import 'package:spotify/features/splash /presentation/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static CustomTransitionPage<void> _buildPageWithTransition({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 280),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.05, 0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            key: state.pageKey,
            child: const SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.getStartScreen,
        name: Routes.getStartScreen,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            key: state.pageKey,
            child: const GetStartScreen(),
          );
        },
      ),
    ],
  );
}
