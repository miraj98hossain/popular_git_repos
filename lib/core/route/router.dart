import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popular_git_repos/presentations/home/home.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: HomePage.routePath,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: HomePage.routePath,
          name: HomePage.routeName,
          pageBuilder: (context, state) => getPage(
            child: const HomePage(),
            state: state,
          ),
        ),
      ]);

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
